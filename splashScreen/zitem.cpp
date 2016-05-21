#include "zitem.h"

/*************************************************************************************************
* Purpose: Default constructor to instantiate Z-shape item and set default values
*
* Precondition: instantiate a Z-shape item object
*
* Postcondition: Z-shape item created, four arrays for rotational states set, inital rotational
* state array set, color and end index set
***************************************************************************************************/
zItem::zItem()
{
    m_shapeStruct.upRight[0][0] = true;
    m_shapeStruct.upRight[0][1] = true;
    m_shapeStruct.upRight[1][1] = true;
    m_shapeStruct.upRight[1][2] = true;

    m_shapeStruct.right[0][2] = true;
    m_shapeStruct.right[1][1] = true;
    m_shapeStruct.right[1][2] = true;
    m_shapeStruct.right[2][1] = true;

    m_shapeStruct.upsideDown[0][0] = true;
    m_shapeStruct.upsideDown[0][1] = true;
    m_shapeStruct.upsideDown[1][1] = true;
    m_shapeStruct.upsideDown[1][2] = true;

    m_shapeStruct.left[0][2] = true;
    m_shapeStruct.left[1][1] = true;
    m_shapeStruct.left[1][2] = true;
    m_shapeStruct.left[2][1] = true;

    for(int i = 0; i < 4; i++)
        for(int j = 0; j < 4; j++)
            m_rotateState[i][j] = m_shapeStruct.upRight[i][j];

    m_endIndex = 30;
    m_color = "#ce93d8";
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
void zItem::rotate()
{
    if(rotateState != 3)    //increment enum to next rotational state
        rotateState = static_cast<rotateShape>(rotateState + 1);
    else                    //return to first rotational state in enum
        rotateState = UPRIGHT;

    switch (rotateState)   //update array and end index to reflect new rotational state
    {
        case UPRIGHT:
            for(int i = 0; i < 4; i++)
                for(int j = 0; j < 4; j++)
                    m_rotateState[i][j] = m_shapeStruct.upRight[i][j];
            m_endIndex = 30;
            break;
        case RIGHT:
            for(int i = 0; i < 4; i++)
                for(int j = 0; j < 4; j++)
                    m_rotateState[i][j] = m_shapeStruct.right[i][j];
            m_endIndex = 29;
            break;
        case UPSIDE_DOWN:
            for(int i = 0; i < 4; i++)
                for(int j = 0; j < 4; j++)
                    m_rotateState[i][j] = m_shapeStruct.upsideDown[i][j];
            m_endIndex = 30;
            break;
        case LEFT:
            for(int i = 0; i < 4; i++)
                for(int j = 0; j < 4; j++)
                    m_rotateState[i][j] = m_shapeStruct.left[i][j];
            m_endIndex = 29;
            break;
        default:
            throw("Rotate state undefined");
    }
    emit moveDetected();  //send signal to Qml that shape rotated
}
/*************************************************************************************************
* Purpose: Reset m_endIndex (upper y-bound) to default value for upright rotational state
*
* Precondition: piece collides and needs to be reset to default for next time it falls
*
* Postcondition: m_endIndex reset to default value for upright rotational position
***************************************************************************************************/
void zItem::resetEndIndex()
{
   m_endIndex = 30;
}
