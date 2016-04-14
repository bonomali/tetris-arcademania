#ifndef LINEITEM_H
#define LINEITEM_H

#include <QObject>
#include "ishapes.h"

class LineItem : public IShapes
{
public:
    LineItem();

//signals:

public slots:
    void Rotate();  //rotate shape
};

#endif // LINEITEM_H
