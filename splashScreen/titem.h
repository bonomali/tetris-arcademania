/***************************************************************************************
* Class: tItem
*
* Purpose: This class is for the T-shaped item in Tetris; it inherits from the ishapes class.
*
* Manager Functions:    tItem()
*							default ctor initializes arrays for each rotated state,
*                           the color of the T shape, and the ending index (y-bound)
*
* Methods:              void rotate()
*							updates array when shape is rotated
*						void resetEndIndex()
*							resets the end index
*****************************************************************************************/
#ifndef TITEM_H
#define TITEM_H

#include "ishapes.h"

class tItem : public ishapes
{
public:
    tItem();
    void rotate();
    void resetEndIndex();
};

#endif // TITEM_H
