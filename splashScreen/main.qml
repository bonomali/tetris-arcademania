//Name: Isaac Harries, Stephanie Vetter
//Lab: 2
//Project Name: Tetris
import QtQuick 2.4
import QtQuick.Controls 1.3

ApplicationWindow {
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
    textArea.text : "Start"
}

Buttons {
    id:leftButton
    width: parent.width * .10; height: parent.height * .10
    anchors.bottom: startButton.top
    anchors.bottomMargin: startButton.height * .50
    anchors.horizontalCenter: startButton.horizontalCenter
    anchors.horizontalCenterOffset: startButton.width * -.35
    textArea.text : "<-"
    }

Buttons {
    id:rightButton
    width: parent.width * .10; height: parent.height * .10
    anchors.bottom: startButton.top
    anchors.bottomMargin: startButton.height * .50
    anchors.horizontalCenter: startButton.horizontalCenter
    anchors.horizontalCenterOffset: startButton.width * .35
    textArea.text : "->"
}

TextRect{
    id:textRect
    height: parent.height * .10
    width: parent.width * .10
    anchors.bottom: startButton.top
    anchors.bottomMargin: startButton.height * .5
    anchors.horizontalCenter: startButton.horizontalCenter
    rectText.font.pointSize: 15
    rectText.text: "1"
    //not centered??
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
    id:startMessage
    rectText.text: "Our project is the game Tetris. The user will use the arrow keys to move falling shapes. The goal of the game is to align the shapes so they create complete horizontal lines along the game play area. When a complete horizontal line is created, it will disappear. Other features will include a game score, a preview of the next shape to fall, a counter for the number of complete lines created, the level of game play, and a speed up feature that will increase the rate at which the shapes fall as the user moves up a game play level."
    diagButton.text: "Okay"
}
}

