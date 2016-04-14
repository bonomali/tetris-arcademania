#ifndef ZITEM_H
#define ZITEM_H

#include <QObject>
#include <QQmlContext>
#include "ishapes.h"

class ZItem : public IShapes
{
public:
    ZItem();

//signals:

public slots:
    void Rotate();  //rotate shape
};

#endif // ZITEM_H
