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

const int ROW = 32;
const int COL = 16;
enum shapeTypes { CUBE, LINE, TITEM, LITEM, MLITEM, ZITEM, MZITEM };
struct gridData{
    bool visible;
    QString color;
};

class MainGrid : public QObject
{
    Q_OBJECT
public:
    MainGrid(ishapes *& cube, ishapes *& line, ishapes *& litem, ishapes *& mlitem, ishapes *& zitem, ishapes *& mzitem, ishapes *& titem);
    ishapes * getAllShapes(int index);

signals:
    void gameOver();
    void completeLine();

public slots:
    bool lineCheck();             //return row# to break, recursive: argument = starting row
    bool updateGrid(int row, int col);  //update grid after shape is dropped
    bool checkIfComplete(int row, int col, int block_type);  //-1 no collision, 0 collision, 1 game over
    bool checkMoveLeft(int row, int col, int block_type);
    bool checkMoveRight(int row, int col, int block_type);
    QString getColor(int row, int col);

protected:
    gridData m_grid[ROW][COL];
    ishapes * m_allShapes [7];
    bool m_gameover;
};

#endif // MAINGRID_H
