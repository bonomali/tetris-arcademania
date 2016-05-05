import QtQuick 2.5

Rectangle {
    id: hud
    property int _score : 0
    property int _goal : _startingGoal
    property int _lineBreaks: 0
    property int _startingGoal: 5
    property alias localBoard: localBoard
    property int _speed: _speedArray[_level - 1]
    property int _level: 1
    property var _speedArray: [900, 750, 550, 400, 350, 300, 250, 200, 150, 100]
    property alias cubeItem1:cubeItem1.visible
    property alias lineItem1:lineItem1.visible
    property alias mLItem1:mLItem1.visible
    property alias lItem1:lItem1.visible
    property alias mZItem1:mZItem1.visible
    property alias zItem1:zItem1.visible
    property alias tItem1:tItem1.visible

    anchors.fill: parent
    color: "grey"

    Background{}
    Board {
    id: localBoard
    }

    Connections {
        target: grid
        onLineBrake: {
            _lineBreaks ++

            if((_lineBreaks % _startingGoal) === 0)
            {
                _level++
                _speed = _speedArray[_level - 1]
            }

            if(_goal != 0)
                _goal--
            else
                _goal = _startingGoal++

            _score = 1000 * _lineBreaks
        }
    }
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
        id: gamePlayTimer
        width: parent.width * .2
        height: parent.height * .04
        radius: parent.width * .005
        anchors.top: parent.top
        anchors.left: score.right
        anchors.leftMargin: score.width * .05
        color: "#AA0060a9"
        rectangleText: "2"
        rectangleFont.pointSize: parent.height * .015
        baseRectangleText.color: "#b9d6e1"
        baseRectangleText.anchors.verticalCenter: verticalCenter
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
            text: _goal
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
        height: parent.height * .15
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

        CubeItem { id: cubeItem1; visible: false; focus: false; sleep.running: false; anchors.horizontalCenter: parent.horizontalCenter; anchors.bottom: parent.bottom; anchors.bottomMargin: parent.height * -.1 }
        LineItem { id:lineItem1;visible: false; focus: false; sleep.running: false; anchors.horizontalCenter: parent.horizontalCenter; anchors.bottom: parent.bottom; anchors.bottomMargin: parent.height * -.1 }
        MLItem { id:mLItem1; visible: false; focus: false; sleep.running: false; anchors.horizontalCenter: parent.horizontalCenter; anchors.bottom: parent.bottom; anchors.bottomMargin: parent.height * -.1 }
        LItem { id:lItem1; visible: false; focus: false; sleep.running: false; anchors.horizontalCenter: parent.horizontalCenter; anchors.bottom: parent.bottom; anchors.bottomMargin: parent.height * -.1 }
        MZItem { id:mZItem1; visible: false; focus: false; sleep.running: false; anchors.horizontalCenter: parent.horizontalCenter; anchors.bottom: parent.bottom; anchors.bottomMargin: parent.height * -.1 }
        ZItem { id:zItem1; visible: false; focus: false; sleep.running: false; anchors.horizontalCenter: parent.horizontalCenter; anchors.bottom: parent.bottom; anchors.bottomMargin: parent.height * -.1 }
        TItem { id:tItem1; visible: false; focus: false; sleep.running: false; anchors.horizontalCenter: parent.horizontalCenter; anchors.bottom: parent.bottom; anchors.bottomMargin: parent.height * -.1 }
    }
}
