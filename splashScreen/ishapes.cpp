#include "ishapes.h"

IShapes::IShapes()
{
    for(int i = 0; i < WIDTH; i++)
    {
        for(int j = 0; j < LENGTH; j++)
        {
            m_shapeArray[i][j] = false;
        }
    }
}

