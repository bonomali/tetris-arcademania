import QtQuick 2.0

Rectangle {
    id: hud
    anchors.fill: parent
    color: "grey"

    Board {

    }

    TextRect {
        id: score
        width: parent.width * .48
        height: parent.height * .04
        //anchors.fill: parent
        //color: "lightblue"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter

        rectangleText: "Score: 1000000"
    }

    TextRect {
        id: level
        width: parent.width * .20
        height: parent.height * .15

        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: parent.height * .3
        anchors.leftMargin: parent.width * .035

        rectangleText: "LEVEL:"
    }

    TextRect {
        id: goal
        width: parent.width * .20
        height: parent.height * .15

        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: parent.height * .5
        anchors.leftMargin: parent.width * .035

        rectangleText: "GOAL:"
    }

    TextRect {
        id: next
        width: parent.width * .20
        height: parent.height * .45

        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: parent.height * .1
        anchors.rightMargin: parent.width * .035

        rectangleText: "NEXT:"
    }
}
