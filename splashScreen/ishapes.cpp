#include "ishapes.h"
#include "array2d.h"

/*************************************************************************************************
* Purpose: Default constructor to instantiate an ishapes object with default values
*
* Precondition: instantiate an ishapes object
*
* Postcondition: ishapes object created with default values
***************************************************************************************************/
ishapes::ishapes() : rotateState(UPRIGHT), m_rotateState(4,4), m_endIndex(0), m_color("#ff0000")
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
/*************************************************************************************************
* Purpose: Return array containing current rotational state of shape
*
* Precondition: none
*
* Postcondition: return m_rotatedState array data member
***************************************************************************************************/
Array2D<bool> ishapes::getRotateState()
{
    return m_rotateState;
}
/*************************************************************************************************
* Purpose: Return color of shape
*
* Precondition: none
*
* Postcondition: return m_color data member
***************************************************************************************************/
QString ishapes::getColor()
{
    return m_color;
}
/*************************************************************************************************
* Purpose: Reset m_rotateState array and rotateState enum to default values for upright
* rotational state
*
* Precondition: piece collides and needs to be reset to default values for next time it falls
*
* Postcondition: m_roateState array and rotateState enum reset to default values for upright
* rotational position
***************************************************************************************************/
void ishapes::resetRotateState()
{
    rotateState = UPRIGHT;

    for(int i = 0; i < 4; i++)
        for(int j = 0; j < 4; j++)
            m_rotateState[i][j] = m_shapeStruct.upRight[i][j];
}
/*************************************************************************************************
* Purpose: Return upper y-bound for shape, which indicates the furthest the shape may fall on the
* y-axis to stay within the bounds of the Tetris grid
*
* Precondition: none
*
* Postcondition: return m_endIndex data member
***************************************************************************************************/
int ishapes::getEndIndex()
{
    return m_endIndex;
}
