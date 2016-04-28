#include <QApplication>
#include <QQmlApplicationEngine>
//#include <QMediaPlayer>
#include "cubeitem.h"
#include "lineitem.h"
#include "maingrid.h"
#include "titem.h"
#include "litem.h"
#include "mlitem.h"
#include "zitem.h"
#include "mzitem.h"
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

    //QKeyEvent event(QEvent::KeyPress, Qt::Key_Down, Qt::NoModifier, "", false);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
