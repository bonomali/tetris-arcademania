#include "maingrid.h"
#include "cubeitem.h"
#include "lineitem.h"
#include "litem.h"
#include "mlitem.h"
#include "mzitem.h"
#include "titem.h"
#include "zitem.h"

MainGrid::MainGrid() : m_gameover(false)
{
   for(int i = 0; i < WID; i++)
       for(int j = 0; j < LEN; j++)
       {
           m_grid[i][j] = false;
       }
}
int MainGrid::LineCheck(int row)
{
    return 0;
}
void MainGrid::UpdateGrid(IShapes* shape)
{
    //placeholder
}
IShapes* MainGrid::GenerateShapes()
{
   // IShapes* shape = new CubeItem();

    return nullptr;
}
