#include <QApplication>
#include <QQmlApplicationEngine>
//#include <QMediaPlayer>
#include "cubeitem.h"
#include <QQmlContext>
#include <Qstring>
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    cubeItem cube;

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    engine.rootContext()->setContextProperty("cube", &cube);
//    engine.rootContext()->setContextProperty("lineItem", &line);
//    engine.rootContext()->setContextProperty("lItem", &LItem);
//    engine.rootContext()->setContextProperty("mlItem", &MLItem);
//    engine.rootContext()->setContextProperty("mzItem", &MZItem);
//    engine.rootContext()->setContextProperty("tItem", &TItem);
//    engine.rootContext()->setContextProperty("zItem", &ZItem);
//    engine.rootContext()->setContextProperty("mainGrid", &MainGrid);

    return app.exec();
}
