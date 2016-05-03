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
