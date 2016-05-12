#ifndef MZITEM_H
#define MZITEM_H

#include "ishapes.h"

class mzItem : public ishapes
{
public:
    mzItem();
    void rotate();
    void resetEndIndex();
    int getEndIndex();
};

#endif // MZITEM_H
