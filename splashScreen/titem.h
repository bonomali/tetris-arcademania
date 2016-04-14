#ifndef TITEM_H
#define TITEM_H

#include <QObject>
#include "ishapes.h"

class TItem : public IShapes
{
public:
    TItem();

//signals:

public slots:
    void Rotate();  //rotate shape
};

#endif // TITEM_H
