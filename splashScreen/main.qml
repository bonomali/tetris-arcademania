//Name: Isaac Harries, Stephanie Vetter
//Lab: 2
//Project Name: Tetris
import QtQuick 2.4
import QtQuick.Controls 1.3
import QtMultimedia 5.6

ApplicationWindow {
    id:appWindow
    property int tilesWide: 16
    property int tilesHigh: 32

    //title: playMusic.errorString
    visible: true
    width: 640
    height: 640

    Audio {
        id: playMusic
        source: "Zen.mp3"
        autoPlay: true
    }

    Hud {}
    SplashMenu{}
}
