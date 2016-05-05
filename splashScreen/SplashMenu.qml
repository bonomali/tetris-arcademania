import QtQuick 2.5
import QtQuick.Controls 1.3

Rectangle{
    id: splashScreen
    anchors.fill: parent
    property int selectedLevel: 1

    Image{
        source: "background.jpg"
        anchors.fill: parent
    }
    Buttons {
        id:startButton
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * .10
        anchors.horizontalCenter: parent.horizontalCenter
        mouseArea.onClicked: {
            currentLevel = selectedLevel
            parent.visible = false, appWindow.initializeBoard1.initializeBoard()
        }
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
            if (selectedLevel > 1)
                selectedLevel--
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
            if (selectedLevel < 10)
                selectedLevel++
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
        rectangleText: selectedLevel
    }

    Image{
        source: "icon.jpg"
        anchors.top: parent.top
        anchors.topMargin: parent.height * .10
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height * .35
        width: parent.width * .90
    }

    Dialog{
        id:ourNames
        height: parent.height * .2
        width: parent.width * .57
        x: parent.width * .20
        y: parent.height * .40
        rectangleFont.pointSize: ourNames.height * .07
        baseRectangleText.anchors.centerIn: ourNames
        diagButtonFont.pointSize: ourNames.height * .07
        rectangleText: "Hello from Isaac and Stephanie!"
        diagButtonText: "Goodbye"
        visible: false
    }

    Dialog{
        id:startMessage
        width: appWindow.width * .8
        height: appWindow.height * .85
        baseRectangleText.width: startMessage.width * .90
        baseRectangleText.height: startMessage.height * .85
        baseRectangleText.anchors.centerIn: startMessage

        rectangleFont.pointSize: startMessage.height * .020
        rectangleText: "Our project is the game Tetris. The user will use the arrow keys to move falling shapes. The goal of the game is to align the shapes so they create complete horizontal lines along the game play area. When a complete horizontal line is created, it will disappear. Other features will include a game score, a preview of the next shape to fall, a counter for the number of complete lines created, the level of game play, and a speed up feature that will increase the rate at which the shapes fall as the user moves up a game play level."
        diagButtonText: "Okay"
        x: parent.width / 11
        y: parent.height / 11
        visible: false
    }
}




