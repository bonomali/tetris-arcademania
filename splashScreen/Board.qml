import QtQuick 2.5
import QTGraphicalEffects 1.0

    Rectangle {
    id: playArea
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.bottomMargin: parent.height * .025
    height: refSquare.height * tilesHigh
    width: refSquare.width * tilesWide
    border.color: "#002355" //dark blue
    border.width: 3

    //Public references to dropping shapes
    property alias sCube: sCube
    property alias sLineItem: sLineItem
    property alias sLItem: sLItem
    property alias sMLItem: sMLItem
    property alias sMZItem: sMZItem
    property alias sTItem: sTItem
    property alias sZItem: sZItem

    property alias refSquare: sCube.refSquare   // reference square used for determining dimensions

    property alias mainGrid:mainGrid // 32 x 16 grid of cubes that visually represents where each shape
                                     // has fallen
    //indices used in for loops
    property int index: 0
    property int i: 0
    property int j: 0

    property int onDeckShape: 0 // Current shape value in the "Next" window

    // Resets the grid and shapes to their default values
    function initializeBoard(){
        grid.resetBoard()

        for(i  = 0; i < 32; i++)
        {
            for (j = 0; j < 16; j++)
            {
                    index = ((i * tilesWide) + j)
                    mainGrid.itemAt(index).visible = false
            }
        }

        resetShapeCoordinates()

        // in case game is reset before game over, reset all shape values to default
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

        fallingShape = -1   // resets the current falling shape value to its default

        generateShape(0,6)  // generates a starting shape
    }

    // resets the shape location upon window resize or a new game is created
    function resetShapeCoordinates()
    {
        sCube.x = refSquare.width * xCoord
        sCube.y = -refSquare.height
        sLineItem.x = refSquare.width * xCoord
        sLineItem.y = -refSquare.height
        sLItem.x = refSquare.width * xCoord
        sLItem.y = -refSquare.height
        sMLItem.x = refSquare.width * xCoord
        sMLItem.y = -refSquare.height
        sMZItem.x = refSquare.width * xCoord
        sMZItem.y = -refSquare.height
        sTItem.x = refSquare.width * xCoord
        sTItem.y = -refSquare.height
        sZItem.x = refSquare.width * xCoord
        sZItem.y = -refSquare.height
    }

    //Randomly generates an integer for both the "Next" shape and the current
    //falling shape
    function generateShape(min, max) {

      // If there is no "Next" shape, generate a new falling shape, otherswise
      // transfer the "Next" shape to the falling shape and generate a new
      // "Next" shape.
      if(fallingShape === -1)
        fallingShape = Math.floor(Math.random() * (max - min + 1)) + min;
      else
        fallingShape = onDeckShape;

      onDeckShape = Math.floor(Math.random() * (max - min + 1)) + min;

      appWindow.cubeItem.visible = false
      appWindow.lineItem.visible = false
      appWindow.mLItem.visible = false
      appWindow.lItem.visible = false
      appWindow.mZItem.visible = false
      appWindow.zItem.visible = false
      appWindow.tItem.visible = false

      // Sets current "Next" shape to visible
      switch(onDeckShape)
        {
        case 0: appWindow.cubeItem.visible = true; break;
        case 1: appWindow.lineItem.visible = true; break;
        case 2: appWindow.lItem.visible = true ; break;
        case 3: appWindow.mLItem.visible = true; break;
        case 4: appWindow.mZItem.visible = true; break;
        case 5: appWindow.tItem.visible = true; break;
        case 6: appWindow.zItem.visible = true; break;
        default: throw("Invalid RNG value");
        }

      // Sets current falling shape into motion
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

    //Handle for the game over signal
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

            // if user does not get a high score show the game over message,
            // otherwise display score board and prompt user for name
            if(!scoreBoard.updateScoreBoard())
            {
                gameOver.visible = true
                gameOver.focus = true
            }
        }
    }

    // If the window size has changed, reset the shape's x and y coordinates
    onHeightChanged: resetShapeCoordinates()

    // Gradient background for grid
    RadialGradient{
        anchors.fill: playArea
        gradient: Gradient{
            GradientStop{
                position: 0
                color: _mainColorArray[0]

                // Transition color if level changed
                ColorAnimation on color {
                    id: outerColorAnim
                    to: _mainColorArray[_level]
                    duration: 5000
                    running: animate
                }

            }
            GradientStop{ position: 0.5
                color: _gradientArray[0]

                // Transition color if level changed
                ColorAnimation on color {
                    id: innerColorAnim
                    to: _gradientArray[_level]
                    duration: 5000
                    running: animate
                }
            }
        }
    }

    // Initialize 32 x 16 grid of Squares for Board
    Repeater {
        id: mainGrid
        model: 512
        Square{
         id: drawnSquare
         y: Math.floor(index/16) * refSquare.height
         x: (index - (Math.floor(index / 16) * 16)) * refSquare.width
         color: "transparent"
        }
    }

    // Declare all shapes
    CubeItem {
        id:sCube
        x: refSquare.width * xCoord
        y: -refSquare.height
        visible: false
        focus: false
        sleep.running: false
        sleep.interval: _speed
    }
    LineItem {
        id:sLineItem
        x: refSquare.width * xCoord
        y: -refSquare.height
        visible: false
        focus: false
        sleep.running: false
        sleep.interval: _speed
    }
    LItem{
        id:sLItem
        x: refSquare.width * xCoord
        y: -refSquare.height
        visible: false
        focus: false
        sleep.running: false
        sleep.interval: _speed
    }
    MLItem{
        id:sMLItem
        x: refSquare.width * xCoord
        y: -refSquare.height
        visible: false
        focus: false
        sleep.running: false
        sleep.interval: _speed
    }
    MZItem{
        id: sMZItem
        x: refSquare.width * xCoord
        y: -refSquare.height
        visible: false
        focus: false
        sleep.running: false
        sleep.interval: _speed
    }
    TItem{
        id: sTItem
        x: refSquare.width * xCoord
        y: -refSquare.height
        visible: false
        focus: false
        sleep.running: false
        sleep.interval: _speed
    }
    ZItem{
        id: sZItem
        x: refSquare.width * xCoord
        y: -refSquare.height
        visible: false
        focus: false
        sleep.running: false
        sleep.interval: _speed
    }

    // Canvas used to draw grid lines
    Canvas {
        id: root
        anchors.fill: parent
        anchors.centerIn: parent
        // handler used for drawing grid lines
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
