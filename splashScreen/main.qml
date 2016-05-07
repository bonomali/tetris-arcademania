//Name: Isaac Harries, Stephanie Vetter
//Lab: 2
//Project Name: Tetris
import QtQuick 2.5
import QtQuick.Controls 1.3
import QtMultimedia 5.6
import Qt.labs.settings 1.0

ApplicationWindow {
    id:appWindow
    property int tilesWide: 16
    property int tilesHigh: 32
    property alias playMusic:playMusic
    property bool muted: false
    property alias initializeBoard1: localHud.localBoard
    property alias currentLevel: localHud._level
    property alias cubeItem1: localHud.cubeItem1
    property alias lineItem1: localHud.lineItem1
    property alias mLItem1: localHud.mLItem1
    property alias lItem1: localHud.lItem1
    property alias mZItem1: localHud.mZItem1
    property alias zItem1: localHud.zItem1
    property alias tItem1: localHud.tItem1
    property alias _level: localHud._level
    //property alias getRandomIntInclusive: getRandomIntInclusive(min, max)
    // Returns a random integer between min (included) and max (included)
    // Using Math.round() will give you a non-uniform distribution!

    //title: playMusic.errorString
    visible: true
    width: 640
    height: 640

    Audio {
        id: playMusic
        source: "Zen.mp3"
        autoPlay: true
        muted: volumeButton.isMuted
        loops: Audio.Infinite
    }

    Settings {
        id: settings_global
        property alias muted: volumeButton.isMuted
    }

    Hud {
    id: localHud
    }
    SplashMenu {
    }
    VolumeButton{
        id:volumeButton
    }

    GameOver{
        id:gameOver
        visible: false
    }
}
