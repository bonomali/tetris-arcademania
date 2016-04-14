#include <QApplication>
#include <QQmlApplicationEngine>
//#include <QMediaPlayer>
#include "cubeitem.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    IShapes* cube = new CubeItem();

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    engine.rootContext()->setContextProperty("cubeItem", cube);
//    engine.rootContext()->setContextProperty("lineItem", &LineItem);
//    engine.rootContext()->setContextProperty("lItem", &LItem);
//    engine.rootContext()->setContextProperty("mlItem", &MLItem);
//    engine.rootContext()->setContextProperty("mzItem", &MZItem);
//    engine.rootContext()->setContextProperty("tItem", &TItem);
//    engine.rootContext()->setContextProperty("zItem", &ZItem);
//    engine.rootContext()->setContextProperty("mainGrid", &MainGrid);

    return app.exec();
}
