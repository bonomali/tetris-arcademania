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
    property int xCoord: 6
    property int yCoord: 0
    property int index: 0
    property int i: 0
    property int j: 0
    property int fallingShape: -1
    property int onDeckShape: 0
    property alias squareRepeater:squareRepeater
    focus: true

    function initializeBoard(){
    //grid.resetBoard()
        for(i  = 0; i < 32; i++)
        {
            for (j = 0; j < 16; j++)
            {
                    index = ((i * tilesWide) + j)
                    squareRepeater.itemAt(index).visible = false
            }
        }

        sCube.state = "UPRIGHT"
        sLineItem.state = "UPRIGHT"
        sLItem.state = "UPRIGHT"
        sMLItem.state = "UPRIGHT"
        sMZItem.state = "UPRIGHT"
        sZItem.state = "UPRIGHT"
        sTItem.state = "UPRIGHT"

        getRandomIntInclusive(0,6)
    }

    function getRandomIntInclusive(min, max) {
      if(fallingShape === -1)
        fallingShape = Math.floor(Math.random() * (max - min + 1)) + min;

      else
          fallingShape = onDeckShape;

      onDeckShape = Math.floor(Math.random() * (max - min + 1)) + min;
      console.log("random deck number ", onDeckShape)

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
            sCube.x = referenceSquare.width * xCoord
            sCube.y = -referenceSquare.height
            sCube.sleep.interval = hud._speed
            break;
        case 1:
            sLineItem.visible = true;
            sLineItem.focus = true;
            sLineItem.sleep.running = true;
            sLineItem.x = referenceSquare.width * xCoord
            sLineItem.y = -referenceSquare.height
            sLineItem.sleep.interval = hud._speed
            break;
        case 2:
            sLItem.visible = true;
            sLItem.focus = true;
            sLItem.sleep.running = true;
            sLItem.x = referenceSquare.width * xCoord
            sLItem.y = -referenceSquare.height
            break;
        case 3:
            sMLItem.visible = true;
            sMLItem.focus = true;
            sMLItem.sleep.running = true;
            sMLItem.x = referenceSquare.width * xCoord
            sMLItem.y = -referenceSquare.height
            break;
        case 4:
            sMZItem.visible = true;
            sMZItem.focus = true;
            sMZItem.sleep.running = true;
            sMZItem.x = referenceSquare.width * xCoord
            sMZItem.y = -referenceSquare.height
            break;
        case 5:
            sTItem.visible = true;
            sTItem.focus = true;
            sTItem.sleep.running = true;
            sTItem.x = referenceSquare.width * xCoord
            sTItem.y = -referenceSquare.height
            break;
        case 6:
            sZItem.visible = true;
            sZItem.focus = true;
            sZItem.sleep.running = true;
            sZItem.x = referenceSquare.width * xCoord
            sZItem.y = -referenceSquare.height
            break;
        default:
            throw("Invalid RNG value");
        }
    }

    Connections {
        target: grid
        onGameOver: {
            gameOver.visible = true
            sCube.state = "GAMEOVER"
            sLineItem.state = "GAMEOVER"
            sLItem.state = "GAMEOVER"
            sMLItem.state = "GAMEOVER"
            sMZItem.state = "GAMEOVER"
            sZItem.state = "GAMEOVER"
            sTItem.state = "GAMEOVER"
            fallingShape = -1
        }
    }

    onHeightChanged:
    {
        switch(fallingShape)
          {
        case 0:
            sCube.x = referenceSquare.width * xCoord
            sCube.y = yCoord * referenceSquare.height
            break;
        case 1:
            sLineItem.x = referenceSquare.width * xCoord
            sLineItem.y = yCoord * referenceSquare.height
            break;
        case 2:
            sLItem.x = referenceSquare.width * xCoord
            sLItem.y = yCoord * referenceSquare.height
            break;
        case 3:
            sMLItem.x = referenceSquare.width * xCoord
            sMLItem.y = yCoord * referenceSquare.height
            break;
        case 4:
            sMZItem.x = referenceSquare.width * xCoord
            sMZItem.y = yCoord * referenceSquare.height
            break;
        case 5:
            sTItem.x = referenceSquare.width * xCoord
            sTItem.y = yCoord * referenceSquare.height
            break;
        case 6:
            sZItem.x = referenceSquare.width * xCoord
            sZItem.y = yCoord * referenceSquare.height
            break;
        default:
            break;
        }
    }

    RadialGradient{
        anchors.fill: playArea
        gradient: Gradient{
            GradientStop{ position: 0.0; color: _mainColorArray[_level - 1]}
            GradientStop{ position: 0.5; color: _gradientArray[_level - 1]}
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
         x: (index - (Math.floor(index/16) * 16)) * referenceSquare.width
         color: "transparent"
        }
    }

    CubeItem {
        id:sCube
        visible: false
        focus: false
        sleep.running: false
        sleep.interval: _speed
    }
    LineItem {
        id:sLineItem
        visible: false
        focus: false
        sleep.running: false
        sleep.interval: _speed
    }
    LItem{
        id:sLItem
        visible: false
        focus: false
        sleep.running: false
        sleep.interval: _speed
    }
    MLItem{
        id:sMLItem
        visible: false
        focus: false
        sleep.running: false
        sleep.interval: _speed
    }
    MZItem{
        id: sMZItem
        visible: false
        focus: false
        sleep.running: false
        sleep.interval: _speed
    }
    TItem{
        id: sTItem
        visible: false
        focus: false
        sleep.running: false
        sleep.interval: _speed
    }
    ZItem{
        id: sZItem
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
