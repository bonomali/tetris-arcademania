#include "maingrid.h"
#include <iostream>
using std::cout;
using std::endl;

MainGrid::MainGrid(ishapes *& cube, ishapes *& line, ishapes *& titem, ishapes *& litem, ishapes *& mlitem, ishapes *& zitem, ishapes *& mzitem)
    : m_gameover(false)
{
    srand(static_cast<unsigned int>(time(nullptr)));  //  using the time seed from srand explanation

   for(int i = 0; i < ROW; i++)
   {
       for(int j = 0; j < COL; j++)
       {
           m_grid[i][j].visible = false;
           m_grid[i][j].color = "#FFFFFF";
       }
   }

   m_allShapes[0] = cube;
   m_allShapes[1] = line;
   m_allShapes[2] = titem;
   m_allShapes[3] = litem;
   m_allShapes[4] = mlitem;
   m_allShapes[5] = zitem;
   m_allShapes[6] = mzitem;

   for(int i = 0; i < 31; i++)
   {
//       for (int j= 8; j <= 31; j++)
//       {
           m_grid[i][3].visible = true;
           m_grid[i][3].color = "#FFFFFF";
           m_grid[i][13].visible = true;
           m_grid[i][13].color = "#FFFFFF";
    //   }
   }
}
bool MainGrid::lineCheck()
{
    bool completeLines = false;
    bool lineFound = true;
    int i = ROW - 1;
    int j = COL - 1;

    for(i = ROW - 1; i >= 0; i--)
    {
        for(j = COL - 1; j >= 0 && lineFound == true; j--)
        {
            if(!m_grid[i][j].visible)
            {
                lineFound = false;
            }
        }

        if(lineFound)
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
            completeLines = true;
        }
        else
            lineFound = true;
    }
    return completeLines;
}
bool MainGrid::updateGrid(int row, int col)
{
    return m_grid[row][col].visible;
}

bool MainGrid::checkIfComplete(int row, int col, int block_type)
{
    bool done = false;
    bool topRow = false;
    Array2D<bool> localShape = m_allShapes[block_type]->getRotateState();

    for(int i = 0; i < 4 && !done; i++)
    {
        for(int j = 0; j < 4 && !done; j++)
        {
           if(localShape[i][j] == true && (m_grid[i + row + 1][j + col].visible == true) || row == m_allShapes[block_type]->getEndIndex())
                {
                   for(int k = 0; k < 4; k++)
                   {
                       for (int l = 0; l < 4; l++)
                       {
                           if(localShape[k][l] == true)
                           {
                               cout << "row: " << k + row << " col: " << l + col << endl;
                               m_grid[k + row][l + col].visible = true;
                               m_grid[k + row][l + col].color = m_allShapes[block_type]->getColor();
                               if(k + row == 1)
                                   topRow = true;
                           }
                       }
                   }

                   done = true;
                    m_allShapes[block_type]->resetRotateState();
                    m_allShapes[block_type]->resetEndIndex();
                }
        }
    }
    if(!lineCheck() && topRow)
         emit gameOver();

    return done;
}
bool MainGrid::checkMoveLeft(int row, int col, int block_type)
{
    bool validMove = true;

    Array2D<bool> localShape = m_allShapes[block_type]->getRotateState();

    for(int i = 0; i < 4 && validMove; i++)
    {
        for(int j = 0; j < 4 && validMove; j++)
        {
           if(localShape[i][j] == true && (m_grid[i + row][j + col - 1].visible == true))
                {
                    cout << "i= " << i << "j= " << j << "col: " << col << endl;
                    validMove = false;
                }
        }
    }

    return validMove;
}

bool MainGrid::checkMoveRight(int row, int col, int block_type)
{
    bool validMove = true;

    Array2D<bool> localShape = m_allShapes[block_type]->getRotateState();

    for(int i = 0; i < 4 && validMove; i++)
    {
        for(int j = 0; j < 4 && validMove; j++)
        {
           if(localShape[i][j] == true && (m_grid[i + row][j + col + 1].visible == true))
                {
                    validMove = false;
                }
        }
    }

    return validMove;
}

ishapes * MainGrid::getAllShapes(int index)
{
    return m_allShapes[index];
}
QString MainGrid::getColor(int row, int col)
{
    return m_grid[row][col].color;
}

void MainGrid::resetBoard()
{
    for(int i = 0; i < ROW; i++)
    {
        for(int j = 0; j < COL; j++)
        {
            m_grid[i][j].visible = false;
            m_grid[i][j].color = "#FFFFFF";
        }
    }
    m_gameover = false;
}
int MainGrid::nextShape()
{
    return rand() % 6;
}
