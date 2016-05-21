/***************************************************************************************
* Class: cubeItem
*
* Purpose: This class is for the cube item in Tetris; it inherits from the ishapes class.
*
* Manager Functions:    cubeItem()
*							default ctor initializes arrays for each rotated state,
*                           the color of the cube, and the ending index (y-bound)
*
* Methods:              void rotate()
*							updates array when shape is rotated
*						void resetEndIndex()
*							resets the end index
*****************************************************************************************/
#ifndef CUBEITEM_H
#define CUBEITEM_H

#include "ishapes.h"

class cubeItem : public ishapes
{
public:
    cubeItem();
    void rotate();
    void resetEndIndex();
};

#endif // CUBEITEM_H
