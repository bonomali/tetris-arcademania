#ifndef LITEM_H
#define LITEM_H

#include "ishapes.h"

class lItem : public ishapes
{
public:
    lItem();
    void rotate();
    void resetEndIndex();
    int getEndIndex();
};

#endif // LITEM_H
