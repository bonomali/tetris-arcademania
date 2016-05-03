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
