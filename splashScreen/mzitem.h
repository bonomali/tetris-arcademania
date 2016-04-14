#ifndef MZITEM_H
#define MZITEM_H

#include <QObject>
#include "ishapes.h"

class MZItem : public IShapes
{
public:
    MZItem();

//signals:

public slots:
    void Rotate();  //rotate shape
};

#endif // MZITEM_H
