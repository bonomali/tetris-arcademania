/***************************************************************************************
* Class: zItem
*
* Purpose: This class is for the Z-Shaped item in Tetris; it inherits from the ishapes class.
*
* Manager Functions:    zItem()
*							default ctor initializes arrays for each rotated state,
*                           the color of the Z shape, and the ending index (y-bound)
*
* Methods:              void rotate()
*							updates array when shape is rotated
*						void resetEndIndex()
*							resets the end index
*****************************************************************************************/
#ifndef ZITEM_H
#define ZITEM_H

#include "ishapes.h"

class zItem : public ishapes
{
public:
    zItem();
    void rotate();
    void resetEndIndex();
};

#endif // ZITEM_H
