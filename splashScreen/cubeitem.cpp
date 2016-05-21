#include "cubeitem.h"

/*************************************************************************************************
* Purpose: Default constructor to instantiate cube item and set default values
*
* Precondition: instantiate a cube item object
*
* Postcondition: cube item created, four arrays for rotational states set, inital rotational state
* array set, color and end index set
***************************************************************************************************/
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
/*************************************************************************************************
* Purpose: Rotate shape and update m_rotateState array and m_endIndex to reflect current rotational
* state
*
* Precondition: player enters input command to rotate shape
*
* Postcondition: shape rotated to next rotational state and m_rotateState array and m_endIndex updated
* to reflect new state
***************************************************************************************************/
void cubeItem::rotate()
{
    //not implemented in cube since rotational state doesn't change with rotation
}
/*************************************************************************************************
* Purpose: Reset m_endIndex (upper y-bound) to default value for upright rotational state
*
* Precondition: piece collides and needs to be reset to default for next time it falls
*
* Postcondition: m_endIndex reset to default value for upright rotational position
***************************************************************************************************/
void cubeItem::resetEndIndex()
{
    m_endIndex = 29;
}

