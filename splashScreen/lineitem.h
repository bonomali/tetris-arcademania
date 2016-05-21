/***************************************************************************************
* Class: lineItem
*
* Purpose: This class is for the line item in Tetris; it inherits from the ishapes class.
*
* Manager Functions:    lineItem()
*							default ctor initializes arrays for each rotated state,
*                           the color of the line, and the ending index (y-bound)
*
* Methods:              void rotate()
*							updates array when shape is rotated
*						void resetEndIndex()
*							resets the end index
*****************************************************************************************/
#ifndef LINEITEM_H
#define LINEITEM_H

#include "ishapes.h"

class lineItem : public ishapes
{
public:
    lineItem();
    void rotate();  //rotate item
    Array2D<bool> getRotateState();
    void resetEndIndex();
};

#endif // LINEITEM_H
