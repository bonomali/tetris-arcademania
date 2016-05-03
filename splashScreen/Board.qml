import QtQuick 2.4
import QTGraphicalEffects 1.0

    Rectangle {
    id: playArea
    property alias squareRepeater:squareRepeater

    function getRandomIntInclusive(min, max) {

      rand = 1;//Math.floor(Math.random() * (max - min + 1)) + min;

        switch(rand)
        {
        case 0:
            sCube.visible = true;
            sCube.focus = true;
            sCube.sleep.running = true;
            sCube.x = referenceSquare.width * 6
            sCube.y = 0
            break;
        case 1:
            sLineItem.visible = true;
            sLineItem.focus = true;
            sLineItem.sleep.running = true;
            sLineItem.x = referenceSquare.width * 6
            sLineItem.y = (0 - referenceSquare.height)
            break;
        case 2:
            sLItem.visible = true;
            sLItem.focus = true;
            sLItem.sleep.running = true;
            sLItem.x = referenceSquare.width * 6
            sLItem.y = (0 - referenceSquare.height)
            break;
        case 3:
            sMLItem.visible = true;
            sMLItem.focus = true;
            sMLItem.sleep.running = true;
            sMLItem.x = referenceSquare.width * 6
            sMLItem.y = (0 - referenceSquare.height)
            break;
        case 4:
            sMZItem.visible = true;
            sMZItem.focus = true;
            sMZItem.sleep.running = true;
            sMZItem.x = referenceSquare.width * 6
            sMZItem.y = (0 - referenceSquare.height)
            break;
        case 5:
            sTItem.visible = true;
            sTItem.focus = true;
            sTItem.sleep.running = true;
            sTItem.x = referenceSquare.width * 6
            sTItem.y = (0 - referenceSquare.height)
            break;
        case 6:
            sZItem.visible = true;
            sZItem.focus = true;
            sZItem.sleep.running = true;
            sZItem.x = referenceSquare.width * 6
            sZItem.y = (0 - referenceSquare.height)
            break;
        default:
            throw("Invalid RNG value");
        }
    }
    //property alias drawnSquare:drawnSquare
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.bottomMargin: parent.height * .025
    height: referenceSquare.height * tilesHigh
    width: referenceSquare.width * tilesWide
    //Component.onCompleted: console.log (height)
    border.color: "#002355"
    border.width: 3
    property int index: 0
    property int i: 0
    property int j: 0
    focus: true

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
        }
    }
//    onWidthChanged:
//    {
//        exampleShape.x = exampleShape.col * (width / tilesWide)
//    }

//    onHeightChanged:
//    {
//        exampleShape.y = exampleShape.row * (height / tilesHigh)

//    }

    Keys.onReturnPressed: {
        getRandomIntInclusive(0,6)
        console.log(rand)
    }

    RadialGradient{
        anchors.fill: playArea
        gradient: Gradient{
            GradientStop{ position: 0.0; color: "#002355"}
            GradientStop{ position: 0.5; color: "#03142b"}
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
    }
    LineItem {
        id:sLineItem
        visible: false
        focus: false
        sleep.running: false
    }
    LItem{
        id:sLItem
        visible: false
        focus: false
        sleep.running: false
    }
    MLItem{
        id:sMLItem
        visible: false
        focus: false
        sleep.running: false
    }
    MZItem{
        id: sMZItem
        visible: false
        focus: false
        sleep.running: false
    }
    TItem{
        id: sTItem
        visible: false
        focus: false
        sleep.running: false
    }
    ZItem{
        id: sZItem
        visible: false
        focus: false
        sleep.running: false
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
