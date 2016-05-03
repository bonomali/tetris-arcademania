#include "mzitem.h"

mzItem::mzItem()
{
    m_shapeStruct.upRight[1][1] = true;
    m_shapeStruct.upRight[1][2] = true;
    m_shapeStruct.upRight[2][0] = true;
    m_shapeStruct.upRight[2][1] = true;

    m_shapeStruct.right[0][1] = true;
    m_shapeStruct.right[1][1] = true;
    m_shapeStruct.right[1][2] = true;
    m_shapeStruct.right[2][2] = true;

    m_shapeStruct.upsideDown[1][1] = true;
    m_shapeStruct.upsideDown[1][2] = true;
    m_shapeStruct.upsideDown[2][0] = true;
    m_shapeStruct.upsideDown[2][1] = true;

    m_shapeStruct.left[0][1] = true;
    m_shapeStruct.left[1][1] = true;
    m_shapeStruct.left[1][2] = true;
    m_shapeStruct.left[2][2] = true;

    for(int i = 0; i < 4; i++)
        for(int j = 0; j < 4; j++)
            m_rotateState[i][j] = m_shapeStruct.upRight[i][j];

    m_color = "#ce93d8";
}
void mzItem::rotate()
{
    if(rotateState != 3)
        rotateState = static_cast<rotateShape>(rotateState + 1);
    else
        rotateState = UPRIGHT;

    switch (rotateState)
    {
        case UPRIGHT:
            for(int i = 0; i < 4; i++)
                for(int j = 0; j < 4; j++)
                    m_rotateState[i][j] = m_shapeStruct.upRight[i][j];
            break;
        case RIGHT:
            for(int i = 0; i < 4; i++)
                for(int j = 0; j < 4; j++)
                    m_rotateState[i][j] = m_shapeStruct.right[i][j];
            break;
        case UPSIDE_DOWN:
            for(int i = 0; i < 4; i++)
                for(int j = 0; j < 4; j++)
                    m_rotateState[i][j] = m_shapeStruct.upsideDown[i][j];
            break;
        case LEFT:
            for(int i = 0; i < 4; i++)
                for(int j = 0; j < 4; j++)
                    m_rotateState[i][j] = m_shapeStruct.left[i][j];
            break;
        default:
            throw("Rotate state undefined");
    }
}
void mzItem::resetEndIndex()
{
    m_endIndex = 31;
}
