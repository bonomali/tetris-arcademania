#ifndef MAINGRID_H
#define MAINGRID_H

#include <QObject>
#include "ishapes.h"

const int WID = 16;
const int LEN = 32;

class MainGrid : public QObject
{
    Q_OBJECT
public:
    MainGrid();

signals:

public slots:
    int LineCheck(int row);            //return row# to break, recursive: argument = starting row
    void UpdateGrid(ishapes* shape); //update grid after shape is dropped
    ishapes* GenerateShapes();      //randomly generate falling shapes

protected:
    bool m_grid[LEN][WID];
    bool m_gameover;
};

#endif // MAINGRID_H
