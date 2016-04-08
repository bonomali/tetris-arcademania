//Name: Isaac Harries, Stephanie Vetter
//Lab: 2
//Project Name: Tetris
import QtQuick 2.4
import QtQuick.Controls 1.3

ApplicationWindow {
    id:appWindow

    property int level: 1
    visible: true
    width: 640
    height: 480

Image{
    source: "background.jpg"
    anchors.fill: parent
}


Buttons {
    id:startButton
    anchors.bottom: parent.bottom
    anchors.bottomMargin: parent.height * .10
    anchors.horizontalCenter: parent.horizontalCenter
    mouseArea.onClicked: Qt.quit()
    buttonText : "Start"
}

Buttons {
    id:leftButton
    width: parent.width * .10; height: parent.height * .10
    anchors.bottom: startButton.top
    anchors.bottomMargin: startButton.height * .50
    anchors.horizontalCenter: startButton.horizontalCenter
    anchors.horizontalCenterOffset: startButton.width * -.35
    mouseArea.onClicked: {
        if (level > 1)
            level--
    }
    buttonText : "<-"
    }

Buttons {
    id:rightButton
    width: parent.width * .10; height: parent.height * .10
    anchors.bottom: startButton.top
    anchors.bottomMargin: startButton.height * .50
    anchors.horizontalCenter: startButton.horizontalCenter
    anchors.horizontalCenterOffset: startButton.width * .35
    mouseArea.onClicked: {
        if (level < 10)
            level++
    }
    buttonText : "->"
}

TextRect{
    id:textRect
    height: parent.height * .10
    width: parent.width * .10
    anchors.bottom: startButton.top
    anchors.bottomMargin: startButton.height * .5
    anchors.horizontalCenter: startButton.horizontalCenter
    rectangleFont.pointSize: 15
    baseRectangleText.anchors.centerIn: textRect
    rectangleText: level
}

Image{
    source: "icon.jpg"
    anchors.top: parent.top
    anchors.topMargin: parent.height * .10
    anchors.horizontalCenter: parent.horizontalCenter
    height: parent.height * .35
    width: parent.width * .75
}

Dialog{
    id:ourNames
    height: parent.height * .2
    width: parent.width * .57
    rectangleFont.pointSize: ourNames.height * .12
    //anchors.centerIn: parent
    baseRectangleText.anchors.centerIn: ourNames
    diagButtonFont.pointSize: ourNames.height * .09
    rectangleText: "Hello from Isaac and Stephanie!"
    diagButtonText: "Goodbye"
    x: parent.width / 11
    y: parent.height / 11
}

Dialog{
    id:startMessage
    width: appWindow.width * .8
    height: appWindow.height * .85
    //anchors.centerIn: parent
    baseRectangleText.width: startMessage.width * .90
    baseRectangleText.height: startMessage.height * .85
    baseRectangleText.anchors.centerIn: startMessage

    rectangleFont.pointSize: startMessage.height * .028
    rectangleText: "Our project is the game Tetris. The user will use the arrow keys to move falling shapes. The goal of the game is to align the shapes so they create complete horizontal lines along the game play area. When a complete horizontal line is created, it will disappear. Other features will include a game score, a preview of the next shape to fall, a counter for the number of complete lines created, the level of game play, and a speed up feature that will increase the rate at which the shapes fall as the user moves up a game play level."
    diagButtonText: "Okay"
    x: parent.width / 11
    y: parent.height / 11

}
}
