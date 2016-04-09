#include <QApplication>
#include <QQmlApplicationEngine>
//#include <QMediaPlayer>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    //QMediaPlayer * player = new QMediaPlayer;
    //connect(player, SIGNAL(positionChanged(qint64)), this, SLOT(positionChanged(qint64)));
//    player->setMedia(QUrl::fromLocalFile("qrc://Mizuumi_no_Tera.mp3"));
//    player->setVolume(100);
//    player->play();

    return app.exec();
}
