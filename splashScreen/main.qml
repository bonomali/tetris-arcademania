//Name: Isaac Harries, Stephanie Vetter
//Lab: 2
//Project Name: Tetris
import QtQuick 2.4
import QtQuick.Controls 1.3

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    //color:

Image{
    source: "background.jpg"
    anchors.fill: parent
}

Buttons {
    id:startButton
    anchors.bottom: parent.bottom
    anchors.bottomMargin: parent.height * .10
    anchors.horizontalCenter: parent.horizontalCenter
    Text{
        id:start
       font.pointSize: 15
       font.bold: true
       text : "Start"
       anchors.centerIn:startButton
    }
}

Buttons {
    id:leftButton
    width: parent.width * .10; height: parent.width * .10
    anchors.bottom: startButton.top
    anchors.bottomMargin: startButton.height * .50
    anchors.horizontalCenter: startButton.horizontalCenter
    anchors.horizontalCenterOffset: startButton.width * -.35
    Text{
        id:leftText
       font.pointSize: 15
       font.bold: true
       text : "<-"
       anchors.centerIn:leftButton
    }
}
Buttons {
    id:rightButton
    width: parent.width * .10; height: parent.width * .10
    anchors.bottom: startButton.top
    anchors.bottomMargin: startButton.height * .50
    anchors.horizontalCenter: startButton.horizontalCenter
    anchors.horizontalCenterOffset: startButton.width * .35
    Text{
       id:rightText
       font.pointSize: 15
       font.bold: true
       text : "->"
       anchors.centerIn:rightButton
    }
}

TextRect{
    id:textRect
    anchors.bottom: startButton.top
    anchors.bottomMargin: startButton.height * .50
    anchors.horizontalCenter: startButton.horizontalCenter
    Text{
        font.pointSize: 15
        font.bold: true
        text : "1"
        anchors.centerIn:textRect
    }
}

Image{
    source: "icon.jpg"
    anchors.top: parent.top
    anchors.topMargin: parent.height * .10
    anchors.horizontalCenter: parent.horizontalCenter
    height: parent.height * .35
    width: parent.width * .75
}
/*
Button {
    property alias mouseArea:mouseArea
    id:iButton
    height: parent.height * .15; width: parent.width * .35
    anchors.bottom: parent.bottom
    anchors.bottomMargin: parent.height * .10
    anchors.horizontalCenter: parent.horizontalCenter
    Text{
        id:start
       font.pointSize: 15
       font.bold: true
       text : "Start"
       anchors.centerIn: iButton
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: iButton.visible = false
        hoverEnabled: iButton.color = "blue"
        //???(hoverDisabled).iButton.color = "red"
    }


        }*/
}
