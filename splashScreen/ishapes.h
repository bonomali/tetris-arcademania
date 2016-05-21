/***************************************************************************************
* Class: ishapes
*
* Purpose: The ishapes class is the base class for all the Tetris shapes. The data members
* in this class are shared by all of the derived classes.
*
* Manager Functions:    ishapes()
*                           default constructor initialzes all rotational state arrays
*                           to false and all other data members to default values
*
* Methods:     Array2D<bool> getRotateState()
*                   return array containing the current state of the shape after rotation
*              QString getColor()
*                   return color of the derived shape
*              void resetRotateState()
*                   set current state array back to initial rotational state (upright)
*              virtual void resetEndIndex() = 0
*                   reset the ending index (upper y bound) back to default (for upright state)
*              Q_INVOKABLE int getEndIndex()
*                   return ending index (upper y bound)
*
* signals:     void moveDetected()
*                   send signal to Qml that shape has be rotated
*
* slots:       virtual void rotate() = 0
*                   rotate shape, set current state array to correct rotational state
*****************************************************************************************/
#ifndef ISHAPES_H
#define ISHAPES_H

#include <QObject>
#include "array2d.h"

const int WIDTH = 4;    //width of m_rotateState array
const int LENGTH = 4;   //length of m_rotateState array

//rotational state of shape
enum rotateShape {UPRIGHT, RIGHT, UPSIDE_DOWN, LEFT};

//contains four arrays holding rotational states of shape
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
    ishapes();                          //default constructor
    Array2D<bool> getRotateState();     //return current rotated state
    QString getColor();                 //return color of shape
    void resetRotateState();            //reset m_rotateState to default
    virtual void resetEndIndex() = 0;   //reset end index
    Q_INVOKABLE int getEndIndex();      //return end index

signals:
    void moveDetected();                //signal for rotation

public slots:
   virtual void rotate() = 0;           //rotate shape

protected:
   shapeStruct m_shapeStruct;           //arrays of rotational states
   Array2D<bool> m_rotateState;         //array of current rotational state
   rotateShape rotateState;             //enum of rotational states
   QString m_color;                     //color of shape
   int m_endIndex;                      //upper y-bound
};

#endif // ISHAPES_H
