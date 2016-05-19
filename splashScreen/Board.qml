import QtQuick 2.5
import QTGraphicalEffects 1.0

    Rectangle {
    id: playArea
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.bottomMargin: parent.height * .025
    height: referenceSquare.height * tilesHigh
    width: referenceSquare.width * tilesWide
    border.color: "#002355"
    border.width: 3
    property alias sCube: sCube
    property alias sLineItem: sLineItem
    property alias sLItem: sLItem
    property alias sMLItem: sMLItem
    property alias sMZItem: sMZItem
    property alias sTItem: sTItem
    property alias sZItem: sZItem

    property int index: 0
    property int i: 0
    property int j: 0
    property int onDeckShape: 0
    property alias squareRepeater:squareRepeater

    function initializeBoard(){

        grid.resetBoard()

        for(i  = 0; i < 32; i++)
        {
            for (j = 0; j < 16; j++)
            {
                    index = ((i * tilesWide) + j)
                    squareRepeater.itemAt(index).visible = false
            }
        }

        resetShapes()

        sCube.visible = false;
        sCube.focus = true;
        sCube.sleep.running = false;
        sLineItem.visible = false;
        sLineItem.focus = true;
        sLineItem.sleep.running = false;
        sLItem.visible = false;
        sLItem.focus = true;
        sLItem.sleep.running = false;
        sMLItem.visible = false;
        sMLItem.focus = true;
        sMLItem.sleep.running = false;
        sMZItem.visible = false;
        sMZItem.focus = true;
        sMZItem.sleep.running = false;
        sTItem.visible = false;
        sTItem.focus = true;
        sTItem.sleep.running = false;
        sZItem.visible = false;
        sZItem.focus = true;
        sZItem.sleep.running = false;

        sCube.state = "UPRIGHT"
        sLineItem.state = "UPRIGHT"
        sLItem.state = "UPRIGHT"
        sMLItem.state = "UPRIGHT"
        sMZItem.state = "UPRIGHT"
        sZItem.state = "UPRIGHT"
        sTItem.state = "UPRIGHT"
        fallingShape = -1
        getRandomIntInclusive(0,6)
    }

    function resetShapes()
    {
        sCube.x = referenceSquare.width * xCoord
        sCube.y = -referenceSquare.height
        sLineItem.x = referenceSquare.width * xCoord
        sLineItem.y = -referenceSquare.height
        sLItem.x = referenceSquare.width * xCoord
        sLItem.y = -referenceSquare.height
        sMLItem.x = referenceSquare.width * xCoord
        sMLItem.y = -referenceSquare.height
        sMZItem.x = referenceSquare.width * xCoord
        sMZItem.y = -referenceSquare.height
        sTItem.x = referenceSquare.width * xCoord
        sTItem.y = -referenceSquare.height
        sZItem.x = referenceSquare.width * xCoord
        sZItem.y = -referenceSquare.height
    }

    function getRandomIntInclusive(min, max) {
      if(fallingShape === -1)
        fallingShape = Math.floor(Math.random() * (max - min + 1)) + min;

      else
        fallingShape = onDeckShape;

      onDeckShape = Math.floor(Math.random() * (max - min + 1)) + min;
      //console.log("random deck number ", onDeckShape)

      appWindow.cubeItem1 = false
      appWindow.lineItem1 = false
      appWindow.mLItem1 = false
      appWindow.lItem1 = false
      appWindow.mZItem1 = false
      appWindow.zItem1 = false
      appWindow.tItem1 = false

      switch(onDeckShape)
        {
        case 0:
            appWindow.cubeItem1 = true
            break;
        case 1:
            appWindow.lineItem1 = true
            break;
        case 2:
            appWindow.lItem1 = true
            break;
        case 3:
            appWindow.mLItem1 = true
            break;
        case 4:
            appWindow.mZItem1 = true
            break;
        case 5:
            appWindow.tItem1 = true
            break;
        case 6:
            appWindow.zItem1 = true
            break;
        default:
            throw("Invalid RNG value");
        }
      switch(fallingShape)
        {
        case 0:
            sCube.visible = true;
            sCube.focus = true;
            sCube.sleep.running = true;
            break;
        case 1:
            sLineItem.visible = true;
            sLineItem.focus = true;
            sLineItem.sleep.running = true;
            break;
        case 2:
            sLItem.visible = true;
            sLItem.focus = true;
            sLItem.sleep.running = true;
            break;
        case 3:
            sMLItem.visible = true;
            sMLItem.focus = true;
            sMLItem.sleep.running = true;
            break;
        case 4:
            sMZItem.visible = true;
            sMZItem.focus = true;
            sMZItem.sleep.running = true;
            break;
        case 5:
            sTItem.visible = true;
            sTItem.focus = true;
            sTItem.sleep.running = true;
            break;
        case 6:
            sZItem.visible = true;
            sZItem.focus = true;
            sZItem.sleep.running = true;
            break;
        default:
            throw("Invalid RNG value");
        }
    }

    Connections {
        target: grid
        onGameOver: {

            sCube.state = "GAMEOVER"
            sLineItem.state = "GAMEOVER"
            sLItem.state = "GAMEOVER"
            sMLItem.state = "GAMEOVER"
            sMZItem.state = "GAMEOVER"
            sZItem.state = "GAMEOVER"
            sTItem.state = "GAMEOVER"
            fallingShape = -1
            playTimer.stop()
            if(!scoreBoard.updateScoreBoard())
            {
                gameOver.visible = true
                gameOver.focus = true
            }
        }
    }

    onHeightChanged:
    {
        resetShapes()
    }

    RadialGradient{
        anchors.fill: playArea
        gradient: Gradient{
            GradientStop{
                position: 0.0
                color: _mainColorArray[0]

                ColorAnimation on color {
                    id: outerColorAnim
                    to: _mainColorArray[_level]
                    duration: animDuration
                    running: animate
                }

            }
            GradientStop{ position: 0.5
                color: _gradientArray[0]
                ColorAnimation on color {
                    id: innerColorAnim
                    to: _gradientArray[_level]
                    duration: animDuration
                    running: animate
                }
            }
        }
    }

    Square{
        id:referenceSquare
        color:"transparent"
        border.color: "transparent"
    }

    Repeater {
        id: squareRepeater
        model: 512
        Square{
         id: drawnSquare
         y: Math.floor(index/16) * referenceSquare.height
         x: (index - (Math.floor(index / 16) * 16)) * referenceSquare.width
         color: "transparent"
        }
    }

    CubeItem {
        id:sCube
        x: topLeft.width * xCoord
        y: -topLeft.height
        visible: false
        focus: false
        sleep.running: false
        sleep.interval: _speed
    }
    LineItem {
        id:sLineItem
        x: topLeft.width * xCoord
        y: -topLeft.height
        visible: false
        focus: false
        sleep.running: false
        sleep.interval: _speed
    }
    LItem{
        id:sLItem
        x: topLeft.width * xCoord
        y: -topLeft.height
        visible: false
        focus: false
        sleep.running: false
        sleep.interval: _speed
    }
    MLItem{
        id:sMLItem
        x: topLeft.width * xCoord
        y: -topLeft.height
        visible: false
        focus: false
        sleep.running: false
        sleep.interval: _speed
    }
    MZItem{
        id: sMZItem
        x: topLeft.width * xCoord
        y: -topLeft.height
        visible: false
        focus: false
        sleep.running: false
        sleep.interval: _speed
    }
    TItem{
        id: sTItem
        x: topLeft.width * xCoord
        y: -topLeft.height
        visible: false
        focus: false
        sleep.running: false
        sleep.interval: _speed
    }
    ZItem{
        id: sZItem
        x: topLeft.width * xCoord
        y: -topLeft.height
        visible: false
        focus: false
        sleep.running: false
        sleep.interval: _speed
    }

    Canvas {
        id: root
        // canvas size
        anchors.fill: parent
        anchors.centerIn: parent
        // handler to override for drawing
        onPaint: {
            // get context to draw with
            var ctx = getContext("2d")
            // setup the stroke
            ctx.strokeStyle = "Black"

            //create vertical grid lines
            for(index = 1; index <= tilesWide; index++)
            {
                ctx.beginPath()
                // top start point
                ctx.moveTo(playArea.width / tilesWide * index,0)
                // bottom end point
                ctx.lineTo(playArea.width / tilesWide * index,playArea.height)
                // stop at end point
                ctx.closePath()
                // paint line
                ctx.stroke()
            }
            for(index = 1; index <= tilesHigh; index++)
            {
                ctx.beginPath()
                // top start point
                ctx.moveTo(0, playArea.height / tilesHigh * index)
                // bottom end point
                ctx.lineTo(playArea.width, playArea.height / tilesHigh * index)
                // stop at end point
                ctx.closePath()
                // paint line
                ctx.stroke()
            }
        }
    }
}
