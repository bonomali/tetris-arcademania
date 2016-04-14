#ifndef LITEM_H
#define LITEM_H

#include <QObject>
#include "ishapes.h"

class LItem : public IShapes
{
public:
    LItem();

//signals:

public slots:
    void Rotate();  //rotate shape
};

#endif // LITEM_H
