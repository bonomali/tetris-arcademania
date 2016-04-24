#include "maingrid.h"
#include "cubeitem.h"
#include "lineitem.h"
#include "titem.h"
#include "litem.h"
#include "mlitem.h"
#include "zitem.h"
#include "mzitem.h"

#include <iostream>

MainGrid::MainGrid() : m_gameover(false)
{
   for(int i = 0; i < ROW; i++)
       for(int j = 0; j < COL; j++)
       {
           m_grid[i][j].visible = false;
           m_grid[i][j].color = "#000000";
       }

   m_grid[0][15].visible = true;
        m_grid[31][0].visible = true;
           m_grid[31][15].visible = true;
              m_grid[0][0].visible = true;

    m_allShapes[0] = new cubeItem();
    m_allShapes[1] = new lineItem();
    m_allShapes[2] = new tItem();
    m_allShapes[3] = new lItem();
    m_allShapes[4] = new mlItem();
    m_allShapes[5] = new zItem();
    m_allShapes[6] = new mzItem();

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
    //bool * localShape = m_allShapes[block_type]->getRotateState();

    //if(localShape[2][2])
      //  std::cout << "true" << std::endl;

    for(int i = 0; i < 4; i++)
    {
        for(int j = 0; j < 4; j++)
        {
           if(/*localShape[i][j] == true && (m_grid[i + row + 1][j + col].visible == true) ||*/ row == 29)
                done = true;
        }
        //std::cout << "row: " << row << " col:" << col << "done: " << done << std::endl;
    }
    return done;

//    switch (static_cast<shapeTypes>(block_type))
//    {
//    case CUBE:
//        break;
//    case LINE:
//        break;
//    case TITEM:
//        break;
//    case LITEM:
//        break;
//    case MLITEM:
//        break;
//    case ZITEM:
//        break;
//    case MZITEM:
//        break;
//    default:
//        throw("Undefined shape for checkIfComplete functions");

//    }

    //std::cout << "IM DONE :D" << std::endl;
}

QString MainGrid::getColor(int row, int col)
{
    return m_grid[row][col].color;
}

ishapes * MainGrid::getAllShapes(int index)
{
    return m_allShapes[index];
}
