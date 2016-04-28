#include <QApplication>
#include <QQmlApplicationEngine>
//#include <QMediaPlayer>
#include "cubeitem.h"
#include "lineitem.h"
#include "maingrid.h"
#include <QQmlContext>
#include <Qstring>
#include <QKeyEvent>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    MainGrid grid;

    QQmlApplicationEngine engine;

    QCoreApplication::setApplicationName("tetris");
    QCoreApplication::setOrganizationName("arcademania");
    QCoreApplication::setOrganizationDomain(".com");
    engine.rootContext()->setContextProperty("grid", &grid);
    engine.rootContext()->setContextProperty("cube", grid.getAllShapes(0));
    engine.rootContext()->setContextProperty("line", grid.getAllShapes(1));
    engine.rootContext()->setContextProperty("titem", grid.getAllShapes(2));
    engine.rootContext()->setContextProperty("litem", grid.getAllShapes(3));
    engine.rootContext()->setContextProperty("mlitem", grid.getAllShapes(4));
    engine.rootContext()->setContextProperty("zitem", grid.getAllShapes(5));
    engine.rootContext()->setContextProperty("mzitem", grid.getAllShapes(6));

    //QKeyEvent event(QEvent::KeyPress, Qt::Key_Down, Qt::NoModifier, "", false);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
