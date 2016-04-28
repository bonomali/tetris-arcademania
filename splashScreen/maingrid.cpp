#include "maingrid.h"
#include <iostream>

MainGrid::MainGrid(ishapes *& cube, ishapes *& line, ishapes *& litem, ishapes *& mlitem, ishapes *& zitem, ishapes *& mzitem, ishapes *& titem)
    : m_gameover(false)
{
   for(int i = 0; i < ROW; i++)
       for(int j = 0; j < COL; j++)
       {
           m_grid[i][j].visible = false;
           m_grid[i][j].color = "#FFFFFF";
       }

   m_allShapes[0] = cube;
   m_allShapes[1] = line;
   m_allShapes[2] = litem;
   m_allShapes[3] = mlitem;
   m_allShapes[4] = zitem;
   m_allShapes[5] = mzitem;
   m_allShapes[6] = titem;

   m_grid[6][15].visible = true;
   m_grid[6][15].color = "#FFFFFF";
//        m_grid[31][0].visible = true;
//           m_grid[31][15].visible = true;
//              m_grid[0][0].visible = true;
}
int MainGrid::lineCheck(int row)
{
    return 0;
}
bool MainGrid::updateGrid(int row, int col)
{
    //std::cout << "row: " << row << ", col: " << col << std::endl;
    return m_grid[row][col].visible;
}
ishapes* MainGrid::generateShapes()
{
   // IShapes* shape = new CubeItem();

    return nullptr;
}
bool MainGrid::checkIfComplete(int row, int col, int block_type)
{
    bool done = false;
    Array2D<bool> localShape = m_allShapes[block_type]->getRotateState();

   //  m_allShapes[block_type]->getRotateState().DisplayArray();
//   if(localShape[1][1])
//        std::cout << "true" << std::endl;

    for(int i = 0; i < 4 && !done; i++)
    {
        for(int j = 0; j < 4 && !done; j++)
        {
           if(localShape[i][j] == true && (m_grid[i + row + 1][j + col].visible == true) || row == 28)
                {
                   for(int k = 0; k < 4; k++)
                   {
                       for (int l = 0; l < 4; l++)
                       {
                           if(localShape[k][l] == true)
                           {
                               m_grid[k + row][l + col - 1].visible = true;
                               m_grid[k + row][l + col - 1].color = m_allShapes[block_type]->getColor();
                           }
                       }
                   }
                    done = true;
                }

//           if(localShape[i][j] == true)
//           {
//               std::cout << "i: " << i << " j: " << j << std::endl;
//           }

        }
        //std::cout << "row: " << row << " col:" << col << "done: " << done << std::endl;
    }

    return done;
}

ishapes * MainGrid::getAllShapes(int index)
{
    return m_allShapes[index];
}
QString MainGrid::getColor(int row, int col)
{
    return m_grid[row][col].color;
}
