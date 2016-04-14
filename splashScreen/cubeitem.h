#ifndef CUBEITEM_H
#define CUBEITEM_H

#include <QObject>
#include "ishapes.h"

class CubeItem : public IShapes
{
public:
    CubeItem();

//signals:

public slots:
     void Rotate();  //rotate shape
};

#endif // CUBEITEM_H
