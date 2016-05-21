/***************************************************************************************
* Class: MainGrid
*
* Purpose: This class maintains the Tetris grid, draws shapes where they fall, checks for
* complete lines and collisions, and checks for end of game
*
* Manager Functions:
*               MainGrid(ishapes *& cube, ishapes *& line, ishapes *& litem, ishapes *& mlitem, ishapes *& zitem, ishapes *& mzitem, ishapes *& titem)
*                   seven-arg constructor initalizes Tetris grid to false, initalizes
*                   array of Tetris shapes and all data members to default values
*
* Methods:     ishapes * getAllShapes(int index)
*                   return array of Tetris shapes
*
* signals:     void gameOver()
*                   send signal to Qml on gameover
*              void lineBrake()
*                   send signal to Qml when complete line made
*              void moveDetected()
*                   send singal to Qml when shape moves left or right
*
* slots:       bool lineCheck()
*                   check for complete lines after piece drops
*              bool updateGrid(int row, int col)
*                   return bool value for specified row and col in Tetris grid
*              bool checkForCollision(int row, int col, int block_type)
*                   check for a downward collision as piece is falling
*              void drawGrid(int row, int col, int block_type)
*                   redraw grid after piece drops into place (collides)
*              bool checkMoveLeft(int row, int col, int block_type)
*                   check if peice can move left without collision
*              bool checkMoveRight(int row, int col, int block_type)
*                   check if peice can move right without collision
*              QString getColor(int row, int col)
*                   return color of Tetris grid at specified row and col
*              void resetBoard()
*                   reset Tetris grid to default values (false)
*****************************************************************************************/
#ifndef MAINGRID_H
#define MAINGRID_H

#include <QObject>
#include "ishapes.h"
#include "maingrid.h"
#include "cubeitem.h"
#include "lineitem.h"
#include "titem.h"
#include "litem.h"
#include "mlitem.h"
#include "zitem.h"
#include "mzitem.h"

const int ROW = 32;       //number of rows in Tetris grid
const int COL = 16;       //number of col in Tetris grid
const int NUMSHAPES = 7;  //number of ishapes objects in m_allShapes array

//Tetris shapes in shape array
enum shapeTypes { CUBE, LINE, TITEM, LITEM, MLITEM, ZITEM, MZITEM };

//data contained in each index in Tetris grid
struct gridData{
    bool visible;   //if index visible
    QString color;  //color of index
};

class MainGrid : public QObject
{
    Q_OBJECT
public:
    MainGrid(ishapes *& cube, ishapes *& line, ishapes *& litem, ishapes *& mlitem, ishapes *& zitem, ishapes *& mzitem, ishapes *& titem);
    ishapes * getAllShapes(int index);    //return array of Tetris shapes

signals:
    void gameOver();                     //send on gameover
    void lineBrake();                    //send when complete line made
    void moveDetected();                 //send when piece moves left or right

public slots:
    bool lineCheck();                   //check for complete line after piece collides
    bool updateGrid(int row, int col);  //return if index in Tetris grid visible for row and col
    bool checkForCollision(int row, int col, int block_type);  //return -1 no collision, 0 collision, 1 game over
    void drawGrid(int row, int col, int block_type);           //redraw Tetris grid after piece collides
    bool checkMoveLeft(int row, int col, int block_type);      //check if shape can move left without collision
    bool checkMoveRight(int row, int col, int block_type);     //check if shape can move right without collision
    QString getColor(int row, int col);                        //return color of index for row and col
    void resetBoard();                                         //reset Tetris grid to visible=false

protected:
    gridData m_grid[ROW][COL];          //Tetris game grid
    ishapes * m_allShapes [NUMSHAPES];  //array of all Tetris shapes
    bool m_gameover;                    //track if gameover
};

#endif // MAINGRID_H
