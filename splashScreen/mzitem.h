/***************************************************************************************
* Class: mzItem
*
* Purpose: This class is for the mirrored-Z item in Tetris; it inherits from the ishapes class.
*
* Manager Functions:    mz()
*							default ctor initializes arrays for each rotated state,
*                           the color of the mirrored-Z, and the ending index (y-bound)
*
* Methods:              void rotate()
*							updates array when shape is rotated
*						void resetEndIndex()
*							resets the end index
*****************************************************************************************/
#ifndef MZITEM_H
#define MZITEM_H

#include "ishapes.h"

class mzItem : public ishapes
{
public:
    mzItem();
    void rotate();
    void resetEndIndex();
};

#endif // MZITEM_H
