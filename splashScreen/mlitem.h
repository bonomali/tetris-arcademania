#ifndef MLITEM_H
#define MLITEM_H

#include "ishapes.h"

class mlItem : public ishapes
{
public:
    mlItem();
    void rotate();
    void resetEndIndex();
    int getEndIndex();
};

#endif // MLITEM_H
