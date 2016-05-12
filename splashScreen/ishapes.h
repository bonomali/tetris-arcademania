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
    void resetRotateState();
    virtual void resetEndIndex() = 0;

signals:
    void test();
    void moveDetected();

public slots:
   virtual void rotate() = 0;  //rotate shape
   virtual int getEndIndex() = 0;

protected:
   shapeStruct m_shapeStruct;
   Array2D<bool> m_rotateState;
   rotateShape rotateState;
   QString m_color;
   int m_endIndex;
};

#endif // ISHAPES_H
