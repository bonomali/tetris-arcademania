#ifndef CUBEITEM_H
#define CUBEITEM_H

#include "ishapes.h"

class cubeItem : public ishapes
{
public:
    cubeItem();
    void rotate();
    void resetEndIndex();
    int getEndIndex();
};

#endif // CUBEITEM_H
