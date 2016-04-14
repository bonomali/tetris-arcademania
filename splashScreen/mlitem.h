#ifndef MLITEM_H
#define MLITEM_H

#include <QObject>
#include "ishapes.h"

class MLItem : public IShapes
{
public:
    MLItem();

//signals:

public slots:
    void Rotate();  //rotate shape
};

#endif // MLITEM_H
