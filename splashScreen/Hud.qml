import QtQuick 2.5
import QTGraphicalEffects 1.0
import QtMultimedia 5.6

Rectangle {
    id: hud
    property int _score : 0
    property int _goal : _startingGoal
    property int _lineBreaks: 0
    property int _startingGoal: 5
    property alias localBoard: localBoard
    property int _speed: _speedArray[_level - 1]
    property int _level: 1
    property int index: 0
    property var _speedArray: [900, 700, 575, 475, 400, 350, 300, 250, 150, 100]
    property var _mainColorArray: ["#002355", "#4f0055", "#550500", "#552800", "#553200", "#554e00", "#315500", "#00554f", "#004055", "#020055"]
    property var _secondaryColorArray: ["#00337b", "#72007b", "#7b0600", "#7b3900", "#7b4800", "#7b7000", "#477b00", "#007b72", "#005e7b", "#02007b"]
    property var _backColorArray: ["#001c44", "#3f0044", "#440400", "#442000", "#442800", "#443e00", "#274400", "#00443f", "#003444", "#020044"]
    property var _windowColorArray: ["#AA0060a9", "#AA9200a9" , "#AAa9001f", "#AAa94900", "#AAa96a00", "#AAa98100", "#AA8aa900", "#AA00a995", "#AA0095a9","#AA0033a9"]
    property var _gradientArray: ["#03142b", "#23032b", "#2b0307", "#2b1a03", "#2b1403", "#2b2703", "#032b09", "#032b2a", "#03222b", "#07032b"]
    property alias cubeItem1:cubeItem1.visible
    property alias lineItem1:lineItem1.visible
    property alias mLItem1:mLItem1.visible
    property alias lItem1:lItem1.visible
    property alias mZItem1:mZItem1.visible
    property alias zItem1:zItem1.visible
    property alias tItem1:tItem1.visible
    property variant sources: ["goal1.wav", "goal1.wav", "goal2.wav", "goal3.wav", "goal3.wav", "goal4.wav", "goal5.wav", "goal5.wav", "goal6.wav", "goal7.wav", "Levelup.wav"]
    property int counter: 0
    property alias anim1: localBackground.anim1
    property color winColor: "#AA0033a9"

    anchors.fill: parent
    color: "grey"

    on_LevelChanged: {
        localBackground.secColor = _backColorArray[_level - 1]
        localBackground.mainColor = _mainColorArray[_level - 1]
        localBackground.backColor = _backColorArray[_level - 1]
        localBackground.triColor = _secondaryColorArray[_level - 1]
    }
    Background{
    id: localBackground
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
            console.log(_lineBreaks)
            if(_goal > 1)
                _goal--
            else
                _goal = _startingGoal++

            _score += 1000 * _lineBreaks

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
        color: _windowColorArray[_level - 1]
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
        color: _windowColorArray[_level - 1]
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
        color: _windowColorArray[_level - 1]
        border.color: "transparent"
        rectangleText: "NEXT"
        baseRectangleText.anchors.horizontalCenter: next.horizontalCenter
        rectangleFont.pointSize: parent.height * .02
        baseRectangleText.color: "#b9d6e1"

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
            width: lItem1.topLeft.width * 4
            height: lItem1.topLeft.height * 2
            radius: appWindow.width * .015
            anchors.centerIn: parent
            color: "transparent"

            CubeItem { id: cubeItem1; visible: false; focus: false; sleep.running: false; x: lItem1.topLeft.width}
            LineItem { id:lineItem1;visible: false; focus: false; sleep.running: false; x: lItem1.topLeft.width}
            MLItem { id:mLItem1; visible: false; focus: false; sleep.running: false; y: -lItem1.topLeft.width}
            LItem { id:lItem1; visible: false; focus: false; sleep.running: false; y: -lItem1.topLeft.width}
            MZItem { id:mZItem1; visible: false; focus: false; sleep.running: false; y: -lItem1.topLeft.width}
            ZItem { id:zItem1; visible: false; focus: false; sleep.running: false; y: -lItem1.topLeft.width}
            TItem { id:tItem1; visible: false; focus: false; sleep.running: false; y: -lItem1.topLeft.width}

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
                        ctx.moveTo(lItem1.topLeft.width * index,0)
                        // bottom end point
                        ctx.lineTo(lItem1.topLeft.width * index, lItem1.topLeft.width * 2)
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
                        ctx.moveTo(0,lItem1.topLeft.width * index)
                        // bottom end point
                        ctx.lineTo(lItem1.topLeft.width * 8, lItem1.topLeft.width * index)
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
