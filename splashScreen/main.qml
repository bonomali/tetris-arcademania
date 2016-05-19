//Name: Isaac Harries, Stephanie Vetter
//Lab: 2
//Project Name: Tetris
import QtQuick 2.5
import QtQuick.Controls 1.3
import QtMultimedia 5.6
import Qt.labs.settings 1.0

ApplicationWindow {
    id:appWindow
    property var _mainColorArray: ["#002355", "#4f0055", "#550500", "#552800", "#553200", "#554e00", "#315500", "#00554f", "#004055", "#020055"]
    property var _secondaryColorArray: ["#00337b", "#72007b", "#7b0600", "#7b3900", "#7b4800", "#7b7000", "#477b00", "#007b72", "#005e7b", "#02007b"]
    property var _backColorArray: ["#001c44", "#3f0044", "#440400", "#442000", "#442800", "#443e00", "#274400", "#00443f", "#003444", "#020044"]
    property var _windowColorArray: ["#AA0060a9", "#AA9200a9" , "#AAa9001f", "#AAa94900", "#AAa96a00", "#AAa98100", "#AA8aa900", "#AA00a995", "#AA0095a9","#AA0033a9"]
    property var _gradientArray: ["#03142b", "#23032b", "#2b0307", "#2b1a03", "#2b1403", "#2b2703", "#032b09", "#032b2a", "#03222b", "#07032b"]
    property int tilesWide: 16
    property int tilesHigh: 32
    property int minutes: 0
    property int seconds: 0
    property alias playMusic:playMusic
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
    property alias playTimer: localHud.playTimer
    property alias splashScreen: splashScreen
    property var _speedArray: [500, 450, 400, 350, 300, 250, 200, 150, 100, 75]
    property bool muted: false
    property alias gamePlayTimer: localHud.gamePlayTimer
    property int _score : 1000
    property bool paused: false
    property int fallingShape: -1
    property bool animate: false
    property int animDuration: 5000
    property int xCoord: 6
    property int yCoord: 0
    property bool collision: false
    property int _levelSelected: 1

    title: playMusic.errorString
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
        id:splashScreen
    }

    VolumeButton{
        id:volumeButton
    }

    HomeButton{}

    GameOver{
        id:gameOver
        visible: false
    }
    ScoreBoard{
        id:scoreBoard
        visible: true
    }
}
