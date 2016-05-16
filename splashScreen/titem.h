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
