#ifndef ZITEM_H
#define ZITEM_H

#include "ishapes.h"

class zItem : public ishapes
{
public:
    zItem();
    void rotate();
    void resetEndIndex();
};

#endif // ZITEM_H
