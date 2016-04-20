#include "maingrid.h"
#include "cubeitem.h"

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
void MainGrid::UpdateGrid(ishapes* shape)
{
    //placeholder
}
ishapes* MainGrid::GenerateShapes()
{
   // IShapes* shape = new CubeItem();

    return nullptr;
}
