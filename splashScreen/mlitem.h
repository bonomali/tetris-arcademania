/***************************************************************************************
* Class: mlItem
*
* Purpose: This class is for the mirrored-L item in Tetris; it inherits from the ishapes class.
*
* Manager Functions:    mlItem()
*							default ctor initializes arrays for each rotated state,
*                           the color of the mirrored_L, and the ending index (y-bound)
*
* Methods:              void rotate()
*							updates array when shape is rotated
*						void resetEndIndex()
*							resets the end index
*****************************************************************************************/
#ifndef MLITEM_H
#define MLITEM_H

#include "ishapes.h"

class mlItem : public ishapes
{
public:
    mlItem();
    void rotate();
    void resetEndIndex();
};

#endif // MLITEM_H
