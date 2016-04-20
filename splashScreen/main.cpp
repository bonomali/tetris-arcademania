#include <QApplication>
#include <QQmlApplicationEngine>
//#include <QMediaPlayer>
#include "cubeitem.h"
#include "lineitem.h"
#include <QQmlContext>
#include <Qstring>
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    ishapes* cube = new cubeItem();
    ishapes* line = new lineItem();

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("cube", cube);
    engine.rootContext()->setContextProperty("line", line);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

//    engine.rootContext()->setContextProperty("lItem", &LItem);
//    engine.rootContext()->setContextProperty("mlItem", &MLItem);
//    engine.rootContext()->setContextProperty("mzItem", &MZItem);
//    engine.rootContext()->setContextProperty("tItem", &TItem);
//    engine.rootContext()->setContextProperty("zItem", &ZItem);
//    engine.rootContext()->setContextProperty("mainGrid", &MainGrid);

    return app.exec();
}
