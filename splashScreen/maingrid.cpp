#include "maingrid.h"

/*************************************************************************************************
* Purpose: Seven-arg constructor to instantiate Tetris game grid
*
* Precondition: Instantiate MainGrid object and pass in ishape pointer objects
*
* Postcondition: MainGrid object instantiated and array of ishapes tetris objects created
***************************************************************************************************/
MainGrid::MainGrid(ishapes *& cube, ishapes *& line, ishapes *& titem, ishapes *& litem, ishapes *& mlitem, ishapes *& zitem, ishapes *& mzitem)
    : m_gameover(false)
{
   for(int i = 0; i < ROW; i++) //set all elements in grid to invisible
   {
       for(int j = 0; j < COL; j++)
       {
           m_grid[i][j].visible = false;
           m_grid[i][j].color = "#FFFFFF";
       }
   }

   m_allShapes[0] = cube;   //create array of Tetris shapes
   m_allShapes[1] = line;
   m_allShapes[2] = titem;
   m_allShapes[3] = litem;
   m_allShapes[4] = mlitem;
   m_allShapes[5] = zitem;
   m_allShapes[6] = mzitem;
}
/*************************************************************************************************
* Purpose: Scan Tetris grid looking for complete lines that need to break (be removed from grid)
* when a piece collides
*
* Precondition: shape collides on Tetris grid
*
* Postcondition: return a bool value indicating if lines were found to break, if lines found, update
* grid by moving grid down by one row (do for each line found)
***************************************************************************************************/
bool MainGrid::lineCheck()
{
    bool completeLines = false; //track if a complete line found (return value)
    bool lineFound = true;      //track if a complete line found (used in algorithm)
    int i = ROW - 1;            //row counter
    int j = COL - 1;            //column counter

    for(i = ROW - 1; i >= 0; i--)   //search Tetris grid for complete lines
    {
        for(j = COL - 1; j >= 0 && lineFound == true; j--)
        {
            if(!m_grid[i][j].visible)
            {
                lineFound = false;  //exit loop if incomplete line
            }
        }

        if(lineFound)   //emit signal if complete line found and adjust grid
        {
            emit lineBrake();

            for(i; i > 0; i--)
            {
                for(j = COL - 1; j >= 0; j--)
                {
                    m_grid[i][j].visible = m_grid[i - 1][j].visible;
                    m_grid[i][j].color = m_grid[i - 1][j].color;
                }
            }
            i = ROW;
            completeLines = true;   //return true
        }
        else
            lineFound = true;   //reset to true to scan next row for lines
    }

    return completeLines;
}
/*************************************************************************************************
* Purpose: Return the visibility bool value in Tetris grid at specified row and column
*
* Precondition: pass in row and column values --> called by Qml to update graphical Tetris grid
*
* Postcondition: return bool value for visibility at specified row and column
***************************************************************************************************/
bool MainGrid::updateGrid(int row, int col)
{
    return m_grid[row][col].visible;
}
/*************************************************************************************************
* Purpose: Return bool value indicating whether shape can move down in Tetris grid or if there will
* be a collision
*
* Precondition: pass in shape's current row and column position and an integer value specifying the
* type of the falling shape  --> function called by Qml to see if shape can move down in grid or if
* shape needs to stop moving down (collision)
*
* Postcondition: return true if shape has collided and needs to stop moving down or false if shape
* may continue to move downward
***************************************************************************************************/
bool MainGrid::checkForCollision(int row, int col, int block_type)
{
    bool done = false;  //bool value to track collision (true if collision)

    //array containing rotation state of falling shape
    Array2D<bool> localShape = m_allShapes[block_type]->getRotateState();

    for(int i = 0; i < 4 && !done; i++) //for each index in shape array, check that shape can move
                                        //down one in grid
    {
        for(int j = 0; j < 4 && !done; j++)
        {
            if(localShape[i][j] == true && (m_grid[i + row + 1][j + col].visible == true) || row == m_allShapes[block_type]->getEndIndex())
                done = true;    //collision-->return true
        }
    }
    return done;
}
/*************************************************************************************************
* Purpose: Redraw Tetris grid after a shape collides to reflect new state
*
* Precondition: shape must collide, pass in row and column where shape collided, and integer
* indicating type of shape
*
* Postcondition: update/redraw grid to reflect newly fallen shape
***************************************************************************************************/
void MainGrid::drawGrid(int row, int col, int block_type)
{
    //array containing rotation state of falling shape
    Array2D<bool> localShape = m_allShapes[block_type]->getRotateState();

    bool topRow = false;  //bool tracking if shape drawn in top row of grid

    for(int i = 0; i < 4; i++) //draw shape to Tetris grid
    {
        for (int j = 0; j < 4; j++)
        {
           if(localShape[i][j] == true)
           {
               m_grid[i + row][j + col].visible = true;
               m_grid[i + row][j + col].color = m_allShapes[block_type]->getColor();

               if(m_grid[1][j + col].visible == true) //check if shape drawn in top row
               {
                   topRow = true;
               }
           }
       }
   }
    m_allShapes[block_type]->resetRotateState(); //reset states to default/upright values
    m_allShapes[block_type]->resetEndIndex();

    if(!lineCheck() && topRow)  //call check line function
         emit gameOver();       //if no lines break and topRow true -->send gameover signal
}
/*************************************************************************************************
* Purpose: Return bool value indicating whether shape can move one column to the left in Tetris
* grid or if there will be a collision
*
* Precondition: pass in shape's current row and column position and an integer value specifying the
* type of the falling shape  --> function called by Qml to see if shape can move one column to the
* left in grid
*
* Postcondition: return true if shape may move to the left by one column or false if shape can't
* because of collision
***************************************************************************************************/
bool MainGrid::checkMoveLeft(int row, int col, int block_type)
{
    bool validMove = true;  //indicate if shape can move one column to left

    //array containing rotation state of falling shape
    Array2D<bool> localShape = m_allShapes[block_type]->getRotateState();

    for(int i = 0; i < 4 && validMove; i++) //for each index in shape array, check that
                                            //shape can move one col to left in grid
    {
        for(int j = 0; j < 4 && validMove; j++)
        {
           if(localShape[i][j] == true && (m_grid[i + row][j + col - 1].visible == true))
                {
                    validMove = false; //collision -->return false
                }
        }
    }

    if(validMove && checkForCollision(row, (col - 1), block_type))  //???????????????????????//
        void moveDetected();

    if(validMove && row != m_allShapes[block_type]->getEndIndex())  //send signal that shape moved
        emit moveDetected();

    return validMove;
}
/*************************************************************************************************
* Purpose: Return bool value indicating whether shape can move one column to the right in Tetris
* grid or if there will be a collision
*
* Precondition: pass in shape's current row and column position and an integer value specifying the
* type of the falling shape  --> function called by Qml to see if shape can move one column to the
* right in grid
*
* Postcondition: return true if shape may move to the right by one column or false if shape can't
* because of collision
***************************************************************************************************/
bool MainGrid::checkMoveRight(int row, int col, int block_type)
{
    bool validMove = true;  //indicate if shape can move one column to right

    //array containing rotation state of falling shape
    Array2D<bool> localShape = m_allShapes[block_type]->getRotateState();

    for(int i = 0; i < 4 && validMove; i++) //for each index in shape array, check that
                                            //shape can move one col to right in grid
    {
        for(int j = 0; j < 4 && validMove; j++)
        {
           if(localShape[i][j] == true && (m_grid[i + row][j + col + 1].visible == true))
                {
                    validMove = false;  //collision -->return false
                }
        }
    }
    if(validMove && checkForCollision(row, (col + 1), block_type))  //???????????????????????//
        void moveDetected();

    if(validMove && row != m_allShapes[block_type]->getEndIndex())  //send signal that shape moved
        emit moveDetected();

    return validMove;
}
/*************************************************************************************************
* Purpose: Return shape at specified index from array of all Tetris shapes
*
* Precondition: pass in index
*
* Postcondition: return ishapes object from m_allShapes array at specified index
***************************************************************************************************/
ishapes * MainGrid::getAllShapes(int index)
{
    if(index < 0 || index > NUMSHAPES)
        throw("index out of bounds");

    return m_allShapes[index];
}
/*************************************************************************************************
* Purpose: Return the color value in Tetris grid at specified row and column
*
* Precondition: pass in row and column values --> called by Qml to update graphical Tetris grid
*
* Postcondition: return color value at specified row and column
***************************************************************************************************/
QString MainGrid::getColor(int row, int col)
{
    return m_grid[row][col].color;
}
/*************************************************************************************************
* Purpose: Reset Tetris grid to default values
*
* Precondition: none -->called by Qml to reset grid for new game
*
* Postcondition: each square in grid set to visible = false and default color, gameover bool set
* to default of false
***************************************************************************************************/
void MainGrid::resetBoard()
{
    for(int i = 0; i < ROW; i++) //reset color and visibility to false for each index in grid
    {
        for(int j = 0; j < COL; j++)
        {
            m_grid[i][j].visible = false;
            m_grid[i][j].color = "#FFFFFF";
        }
    }
    m_gameover = false;         //reset gameover bool to false
}
