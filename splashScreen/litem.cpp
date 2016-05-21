#include "litem.h"

/*************************************************************************************************
* Purpose: Default constructor to instantiate L-shape item and set default values
*
* Precondition: instantiate a L-shape item object
*
* Postcondition: L-shape item created, four arrays for rotational states set, inital rotational state
* array set, color and end index set
***************************************************************************************************/
lItem::lItem()
{
    m_shapeStruct.upRight[1][0] = true;
    m_shapeStruct.upRight[1][1] = true;
    m_shapeStruct.upRight[1][2] = true;
    m_shapeStruct.upRight[2][0] = true;

    m_shapeStruct.right[0][0] = true;
    m_shapeStruct.right[0][1] = true;
    m_shapeStruct.right[1][1] = true;
    m_shapeStruct.right[2][1] = true;

    m_shapeStruct.upsideDown[2][0] = true;
    m_shapeStruct.upsideDown[2][1] = true;
    m_shapeStruct.upsideDown[2][2] = true;
    m_shapeStruct.upsideDown[1][2] = true;

    m_shapeStruct.left[0][1] = true;
    m_shapeStruct.left[1][1] = true;
    m_shapeStruct.left[2][1] = true;
    m_shapeStruct.left[2][2] = true;

    for(int i = 0; i < 4; i++)
        for(int j = 0; j < 4; j++)
            m_rotateState[i][j] = m_shapeStruct.upRight[i][j];

    m_color = "#ffa500";
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
void lItem::rotate()
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

                m_endIndex = 29;
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

                m_endIndex = 29;
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
void lItem::resetEndIndex()
{
    m_endIndex = 29;
}
