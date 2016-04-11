import QtQuick 2.0

Rectangle {
    id: hud
    property int _score : 0
    property int _goal : 0
    property int _level : 0

    anchors.fill: parent
    color: "grey"

    Background{}
    Board {}

    TextRect {
        id: score
        width: parent.width * .48
        height: parent.height * .04
        radius: parent.width * .005
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#AA0060a9"
        rectangleText: " Score: " + _score
        rectangleFont.pointSize: parent.height * .015
        baseRectangleText.color: "#b9d6e1"
        baseRectangleText.anchors.verticalCenter: score.verticalCenter
        border.color: "transparent"
    }

    TextRect {
        id: level
        width: parent.width * .20
        height: parent.height * .15
        radius: parent.width * .015
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: parent.height * .3
        anchors.leftMargin: parent.width * .035
        color: "#AA0060a9"
        rectangleText: "LEVEL"
        baseRectangleText.color: "#b9d6e1"
        baseRectangleText.anchors.horizontalCenter: level.horizontalCenter
        rectangleFont.pointSize: parent.height * .02
        border.color: "transparent"
        Text{
            text:_level
            anchors.centerIn : parent
            anchors.verticalCenterOffset: parent.height * .1
            font.bold: true
            font.pointSize: hud.height * .05
            color: "#b9d6e1"
        }

    }

    TextRect {
        id: goal
        width: parent.width * .20
        height: parent.height * .15
        radius: parent.width * .015
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: parent.height * .5
        anchors.leftMargin: parent.width * .035
        color: "#AA0060a9"
        rectangleText: "GOAL"
        rectangleFont.pointSize: parent.height * .02
        baseRectangleText.color: "#b9d6e1"
        baseRectangleText.anchors.horizontalCenter: goal.horizontalCenter
        border.color: "transparent"
        Text{
            text:_goal
            anchors.centerIn : parent
            font.bold: true
            font.pointSize: hud.height * .05
            anchors.verticalCenterOffset: parent.height * .1
            color: "#b9d6e1"
        }
    }

    TextRect {
        id: next
        width: parent.width * .20
        height: parent.height * .45
        radius: parent.width * .015
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: parent.height * .1
        anchors.rightMargin: parent.width * .035
        color: "#AA0060a9"
        border.color: "transparent"
        rectangleText: "NEXT"
        baseRectangleText.anchors.horizontalCenter: next.horizontalCenter
        rectangleFont.pointSize: parent.height * .02
        baseRectangleText.color: "#b9d6e1"
    }
}
