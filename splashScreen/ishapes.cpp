#include "ishapes.h"

ishapes::ishapes() : rotateState(UPRIGHT)
{
    for(int i = 0; i < WIDTH; i++)
    {
        for(int j = 0; j < LENGTH; j++)
        {
            m_shapeStruct.upRight[i][j] = false;
            m_shapeStruct.right[i][j] = false;
            m_shapeStruct.upsideDown[i][j] = false;
            m_shapeStruct.left[i][j] = false;
            m_currentState[i][j] = false;
        }
    }
}
