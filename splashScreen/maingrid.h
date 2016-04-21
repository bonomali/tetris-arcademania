#ifndef MAINGRID_H
#define MAINGRID_H

#include <QObject>
#include "ishapes.h"

const int WID = 16;
const int LEN = 32;
enum shapeTypes { CUBE, LINE, TITEM, LITEM, MLITEM, ZITEM, MZITEM };
struct gridData{
    bool visible;
    QString color;
};

class MainGrid : public QObject
{
    Q_OBJECT
public:
    MainGrid();

signals:

public slots:
    int lineCheck(int row);             //return row# to break, recursive: argument = starting row
    bool updateGrid(int row, int col);  //update grid after shape is dropped
    ishapes* generateShapes();          //randomly generate falling shapes
    bool checkIfComplete(int row, int col, int block_type);
    QString getColor(int row, int col);

protected:
    gridData m_grid[LEN][WID];
    bool m_gameover;
};

#endif // MAINGRID_H
