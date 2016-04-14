#ifndef ISHAPES_H
#define ISHAPES_H

#include <QObject>

const int WIDTH = 4;
const int LENGTH = 4;

class IShapes : public QObject
{
    Q_OBJECT

public:
    IShapes();

//signals:

//public slots:
   virtual void Rotate() = 0;  //rotate shape

protected:
   bool m_shapeArray[WIDTH][LENGTH];
};

#endif // ISHAPES_H
