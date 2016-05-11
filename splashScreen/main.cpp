#include <QApplication>
#include <QQmlApplicationEngine>
#include "cubeitem.h"
#include "lineitem.h"
#include "maingrid.h"
#include "titem.h"
#include "litem.h"
#include "mlitem.h"
#include "zitem.h"
#include "mzitem.h"
#include "scoreboard.h"
#include <QQmlContext>
#include <Qstring>
#include <QKeyEvent>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    ishapes * cube = new cubeItem();
    ishapes * lineitem = new lineItem();
    ishapes * titem = new tItem();
    ishapes * litem = new lItem();
    ishapes * mlitem = new mlItem();
    ishapes * zitem = new zItem();
    ishapes * mzitem = new mzItem();
    MainGrid grid(cube, lineitem, titem, litem, mlitem, zitem, mzitem);

    ScoreBoard score_board;

    QQmlApplicationEngine engine;

    QCoreApplication::setApplicationName("tetris");
    QCoreApplication::setOrganizationName("arcademania");
    QCoreApplication::setOrganizationDomain(".com");
    engine.rootContext()->setContextProperty("grid", &grid);
    engine.rootContext()->setContextProperty("cube", cube);
    engine.rootContext()->setContextProperty("line", lineitem);
    engine.rootContext()->setContextProperty("titem", titem);
    engine.rootContext()->setContextProperty("litem", litem);
    engine.rootContext()->setContextProperty("mlitem", mlitem);
    engine.rootContext()->setContextProperty("zitem", zitem);
    engine.rootContext()->setContextProperty("mzitem", mzitem);
    engine.rootContext()->setContextProperty("score_board", &score_board);

    QKeyEvent event(QEvent::KeyPress, Qt::Key_Down, Qt::NoModifier, "", false);
    QKeyEvent event2(QEvent::KeyRelease, Qt::Key_Down, Qt::NoModifier, "", false);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
