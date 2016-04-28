#include <iostream>
#include "ishapes.h"
#include "array2d.h"

ishapes::ishapes() : rotateState(UPRIGHT), m_rotateState(4,4)
{
    for(int i = 0; i < WIDTH; i++)
    {
        for(int j = 0; j < LENGTH; j++)
        {
            m_shapeStruct.upRight[i][j] = false;
            m_shapeStruct.right[i][j] = false;
            m_shapeStruct.upsideDown[i][j] = false;
            m_shapeStruct.left[i][j] = false;
            m_rotateState[i][j] = false;
        }
    }
}

Array2D<bool> ishapes::getRotateState()
{
    return m_rotateState;
}

QString ishapes::getColor()
{
    return m_color;
}
