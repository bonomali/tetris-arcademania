#ifndef CUBEITEM_H
#define CUBEITEM_H

#include <QObject>
#include <QQmlContext>

const int WIDTH = 4;
const int LENGTH = 4;

class cubeItem : public QObject
{
    Q_OBJECT
public:
    cubeItem();

signals:


public slots:
     void rotate();  //rotate shape

private:
     bool m_shapeArray[WIDTH][LENGTH]; 
};

#endif // CUBEITEM_H
