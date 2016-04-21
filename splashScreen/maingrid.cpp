#include "maingrid.h"
#include "cubeitem.h"
#include <iostream>

MainGrid::MainGrid() : m_gameover(false)
{
   for(int i = 0; i < WID; i++)
       for(int j = 0; j < LEN; j++)
       {
           m_grid[i][j].visible = false;
           m_grid[i][i].color = "#000000";
       }

   m_grid[14][14].visible = true;
      //m_grid[5][10].visible = true;
         //m_grid[3][0].visible = true;
           // m_grid[0][0].visible = true;
               //m_grid[15][31].visible = true;
                  //m_grid[0][31].visible = true;
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
    bool done = true;
    std::cout << "IM DONE :D" << std::endl;
    return done;
}

QString MainGrid::getColor(int row, int col)
{
    return m_grid[row][col].color;
}
