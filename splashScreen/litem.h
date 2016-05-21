/***************************************************************************************
* Class: lItem
*
* Purpose: This class is for the L-shaped item in Tetris; it inherits from the ishapes class.
*
* Manager Functions:    lItem()
*							default ctor initializes arrays for each rotated state,
*                           the color of the L shape, and the ending index (y-bound)
*
* Methods:              void rotate()
*							updates array when shape is rotated
*						void resetEndIndex()
*							resets the end index
*****************************************************************************************/
#ifndef LITEM_H
#define LITEM_H

#include "ishapes.h"

class lItem : public ishapes
{
public:
    lItem();
    void rotate();
    void resetEndIndex();
};

#endif // LITEM_H
