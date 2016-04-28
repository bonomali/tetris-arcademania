#ifndef ISHAPES_H
#define ISHAPES_H

#include <QObject>
#include "array2d.h"

const int WIDTH = 4;
const int LENGTH = 4;
enum rotateShape {UPRIGHT, RIGHT, UPSIDE_DOWN, LEFT};
struct shapeStruct{
    bool upRight[WIDTH][LENGTH];
    bool right[WIDTH][LENGTH];
    bool upsideDown[WIDTH][LENGTH];
    bool left[WIDTH][LENGTH];
};

class ishapes : public QObject
{
    Q_OBJECT

public:
    ishapes();
    Array2D<bool> getRotateState();
    QString getColor();

signals:
    void test();

public slots:
   virtual void rotate() = 0;  //rotate shape

protected:
   shapeStruct m_shapeStruct;
   Array2D<bool> m_rotateState;
   rotateShape rotateState;
   QString m_color;
};

#endif // ISHAPES_H
