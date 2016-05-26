import QtQuick 2.5
import QTGraphicalEffects 1.0
import QtMultimedia 5.6

Rectangle {
    id: hud
    property int _goal : _startingGoal
    property int _lineBreaks: 0
    property int _startingGoal: 5
    property alias localBoard: localBoard
    property int _speed: _speedArray[_level - 1]
    property int _level: 1
    property int index: 0
    property alias cubeItem:cubeItem
    property alias lineItem:lineItem
    property alias mLItem:mLItem
    property alias lItem:lItem
    property alias mZItem:mZItem
    property alias zItem:zItem
    property alias tItem:tItem
    property variant sources: ["goal1.wav", "goal1.wav", "goal2.wav", "goal3.wav", "goal3.wav", "goal4.wav", "goal5.wav", "goal5.wav", "goal6.wav", "goal7.wav", "Levelup.wav"]
    property int counter: 0
    property alias backCubeAnim: localBackground.backCubeAnim
    property color winColor: "#AA0033a9"
    property alias mainGrid: localBoard.mainGrid
    property alias playArea: localBoard
    property alias playTimer: playTimer
    property alias gamePlayTimer: gamePlayTimer.rectangleText

    anchors.fill: parent
    color: "grey"

    on_LevelChanged: {
        animate = true
        timerColorAnim.running = true
    }

    Timer {
            id: playTimer
            interval: 1000;
            repeat: true
            running: true

            onTriggered: {
                seconds++

                if(seconds % 60 === 0)
                {
                    minutes++
                    seconds = 0
                }

                gamePlayTimer.rectangleText = minutes + ":" + ((seconds < 10) ? "0": "") + seconds
            }
        }

    Background{
    id: localBackground

    ColorAnimation on color {
        id: backColorAnim
        to: _backColorArray[_level]
        duration: 5000
        running: animate
    }

    }
    Board {
    id: localBoard
    }

    Audio {
        id: lineBreakSFX
        source: sources[counter]
        autoLoad: true
    }

    Connections {
        target: backColorAnim
        onStopped: {
            animate = false
        }
    }

    Connections {
        target: lineBreakSFX
        onStopped: {
            if (counter < 10)
                counter++
            else
                counter = 0
        }
    }
    Connections {
        target: grid
        onLineBrake: {
            _lineBreaks++

            if(_lineBreaks % _startingGoal === 0)
            {
                _level++
                _speed = _speedArray[_level - 1]
                counter = 10
               _lineBreaks = 1
            }
            if(_goal > 1)
                _goal--
            else
                _goal = _startingGoal++

            _score += 1000

            lineBreakSFX.play()
        }
    }
    TextRect {
        id: score
        width: parent.width * .48
        height: parent.height * .04
        radius: parent.width * .005
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        color: _windowColorArray[_level - 1]
        rectangleText: " Score: " + _score
        rectangleFont.pointSize: parent.height * .015
        baseRectangleText.color: "#b9d6e1"
        baseRectangleText.anchors.verticalCenter: score.verticalCenter
        border.color: "transparent"

        ColorAnimation on color {
            id: cubeColorAnim
            to: _windowColorArray[_level]
            duration: 5000
            running: animate
        }

    }

    TextRect {
        id: gamePlayTimer
        width: parent.width * .2
        height: parent.height * .04
        radius: parent.width * .005
        anchors.top: parent.top
        anchors.left: score.right
        anchors.leftMargin: score.width * .05
        color: _windowColorArray[_level - 1]
        rectangleText: "0:00"
        rectangleFont.pointSize: parent.height * .015
        baseRectangleText.color: "#b9d6e1"
        baseRectangleText.anchors.centerIn: gamePlayTimer
        border.color: "transparent"

        ColorAnimation on color {
            id: timerColorAnim
            to: _windowColorArray[_level]
            duration: 5000
            running: animate
        }
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
        color: _windowColorArray[_level - 1]
        rectangleText: "LEVEL"
        baseRectangleText.color: "#b9d6e1"
        baseRectangleText.anchors.horizontalCenter: level.horizontalCenter
        rectangleFont.pointSize: parent.height * .02
        border.color: "transparent"

        ColorAnimation on color {
            id: levelColorAnim
            to: _windowColorArray[_level]
            duration: 5000
            running: animate
        }

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
        color: _windowColorArray[_level - 1]
        rectangleText: "GOAL"
        rectangleFont.pointSize: parent.height * .02
        baseRectangleText.color: "#b9d6e1"
        baseRectangleText.anchors.horizontalCenter: goal.horizontalCenter
        border.color: "transparent"

        ColorAnimation on color {
            id: goalcolorAnim
            to: _windowColorArray[_level]
            duration: 5000
            running: animate
        }

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
        color: _windowColorArray[_level - 1]
        border.color: "transparent"
        rectangleText: "NEXT"
        baseRectangleText.anchors.horizontalCenter: next.horizontalCenter
        rectangleFont.pointSize: parent.height * .02
        baseRectangleText.color: "#b9d6e1"

        ColorAnimation on color {
            id: nextcolorAnim
            to: _windowColorArray[_level]
            duration: 5000
            running: animate
        }


        TextRect {
            width: parent.width * .80
            height: parent.height * .60
            radius: appWindow.width * .015
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height * .075
            color: "#BB000000"
            border.color: "black"

            Rectangle {
                width: lItem.topLeft.width * 4
                height: lItem.topLeft.height * 2
                radius: appWindow.width * .015
                anchors.centerIn: parent
                color: "transparent"

                CubeItem { id: cubeItem; visible: false; focus: false; sleep.running: false; y: -lItem.topLeft.width}
                LineItem { id:lineItem;visible: false; focus: false; sleep.running: false; x: lItem.topLeft.width}
                MLItem { id:mLItem; visible: false; focus: false; sleep.running: false; y: -lItem.topLeft.width}
                LItem { id:lItem; visible: false; focus: false; sleep.running: false; y: -lItem.topLeft.width}
                MZItem { id:mZItem; visible: false; focus: false; sleep.running: false; y: -lItem.topLeft.width}
                ZItem { id:zItem; visible: false; focus: false; sleep.running: false; y: -lItem.topLeft.width}
                TItem { id:tItem; visible: false; focus: false; sleep.running: false; y: -lItem.topLeft.width}

                Canvas {
                    id: nextGrid
                    anchors.fill: parent
                    anchors.centerIn: parent
                    onPaint: {
                        // get context to draw with
                        var ctx = getContext("2d")
                        // setup the stroke
                        ctx.strokeStyle = "Black"
                        //create vertical grid lines
                        for(index = 0; index <= 8; index++)
                        {
                            ctx.beginPath()
                            // top start point
                            ctx.moveTo(lItem.topLeft.width * index,0)
                            // bottom end point
                            ctx.lineTo(lItem.topLeft.width * index, lItem.topLeft.width * 2)
                            // stop at end point
                            ctx.closePath()
                            // paint line
                            ctx.stroke()
                        }
                        //create horizontal grid lines
                        for(index = 0; index <= 2; index++)
                        {
                            ctx.beginPath()
                            // top start point
                            ctx.moveTo(0,lItem.topLeft.width * index)
                            // bottom end point
                            ctx.lineTo(lItem.topLeft.width * 8, lItem.topLeft.width * index)
                            // stop at end point
                            ctx.closePath()
                            // paint line
                            ctx.stroke()
                        }
                    }
                }
            }
        }
    }
}
