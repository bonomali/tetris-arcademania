#ifndef TITEM_H
#define TITEM_H

#include "ishapes.h"

class tItem : public ishapes
{
public:
    tItem();
    void rotate();
    void resetEndIndex();
    int getEndIndex();
};

#endif // TITEM_H
