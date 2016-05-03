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
