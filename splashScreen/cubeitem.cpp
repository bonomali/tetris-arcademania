#include "cubeitem.h"
#include <iostream>
using namespace std;

cubeItem::cubeItem()
{ 
    m_shapeStruct.upRight[1][1] = true;
    m_shapeStruct.upRight[1][2] = true;
    m_shapeStruct.upRight[2][1] = true;
    m_shapeStruct.upRight[2][2] = true;

    m_shapeStruct.right[1][1] = true;
    m_shapeStruct.right[1][2] = true;
    m_shapeStruct.right[2][1] = true;
    m_shapeStruct.right[2][1] = true;

    m_shapeStruct.upsideDown[1][1] = true;
    m_shapeStruct.upsideDown[1][2] = true;
    m_shapeStruct.upsideDown[2][1] = true;
    m_shapeStruct.upsideDown[2][1] = true;

    m_shapeStruct.left[1][1] = true;
    m_shapeStruct.left[1][2] = true;
    m_shapeStruct.left[2][1] = true;
    m_shapeStruct.left[2][1] = true;

    for(int i = 0; i < 4; i++)
        for(int j = 0; j < 4; j++)
            m_rotateState[i][j] = m_shapeStruct.upRight[i][j];

    m_color = "#ffff00";
    m_endIndex = 29;
}
void cubeItem::rotate()
{
}
void cubeItem::resetEndIndex()
{
    m_endIndex = 29;
}
int cubeItem::getEndIndex()
{
     cout << "cube item end index" << m_endIndex << endl;
    return m_endIndex;
}
