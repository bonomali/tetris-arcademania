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
