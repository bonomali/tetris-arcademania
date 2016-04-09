//Name: Isaac Harries, Stephanie Vetter
//Lab: 2
//Project Name: Tetris
import QtQuick 2.4
import QtQuick.Controls 1.3
//import QtMultimedia 5.6

ApplicationWindow {
    id:appWindow
    title: song.errorString
    property int level: 1
    visible: true
    width: 640
    height: 640

    Hud {

    }

//    Square{
//    anchors.centerIn: parent
//    color: "blue"
//    }

    SplashMenu{}

    CubeItem {
        anchors.centerIn: parent
    }

}
