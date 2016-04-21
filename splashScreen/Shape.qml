import QtQuick 2.4

Item {
    id: basicShape
    property alias topRight:topRight
    property alias topLeft:topLeft
    property alias secondRight:secondRight
    property alias secondLeft:secondLeft
    property alias thirdRight:thirdRight
    property alias thirdLeft:thirdLeft
    property alias bottomRight:bottomRight
    property alias bottomLeft:bottomLeft
    property alias sleep:sleep;
    property int shapeWidth: topLeft.width * 2
    property int shapeHeight: topLeft.height * 4
    property int row: 0
    property int col: 0
    property int y_wait: 0
    property int rot: 0
    property int i: 0
    property int j: 0
    property int index: 0
    state: "NARROWEST"

    width: topLeft.width * 2
    height: topLeft.height * 4
    property color shapeColor: "yellow"

    states: [
           State { name: "WIDEST" },
           State { name: "NARROWEST" },
           State { name: "STOP" }
       ]
    focus: true
    Keys.onPressed: {
        if(event.key === Qt.Key_Left)
        {
            if(state === "NARROWEST" && x > 0 ||
                state === "WIDEST" && x > topLeft.width)
                    x -= topLeft.width

        }
        else if(event.key === Qt.Key_Right)
        {
            if(state === "NARROWEST" && x < (playArea.width - shapeWidth) ||
                    state === "WIDEST" && x < playArea.width - topLeft.width * 3)
                        x += topLeft.width
        }
        else if(event.key === Qt.Key_Up)
        {
            if(basicShape.x != 0 && basicShape.x < playArea.width - topLeft.width * 2)
            {
                //console.log(basicShape.x)
                //console.log(playArea.width)
                if(rot === 0 && state === "NARROWEST" && y <= playArea.height - shapeHeight)
                {
                    rot = 90
                    state = "WIDEST"
                    //console.log(state)
                }
                else if(y < playArea.height - shapeHeight && state === "WIDEST")
                {
                    rot = 0
                    state = "NARROWEST"
                    //console.log(state)
                }
                basicShape.rotation = rot
            }
        }
        else if(event.key === Qt.Key_Down && y < playArea.height - shapeHeight)
        {
            sleep.interval = 100
        }
          event.accept = true
    }

//    Keys.onDownPressed: {
//        sleep.interval = 100
//    }

//    Keys.onReleased:
//    {
//        if(event.key === Qt.Key_Down && y < playArea.height - shapeHeight)
//            sleep.interval = 1000
//    }

    Keys.onReturnPressed: {
        line.rotate()
    }
        Timer
        {
            id:sleep
            interval: 1000
            running: true
            repeat: true
            onTriggered:
            {
                if(state === "NARROWEST" && y < playArea.height - shapeHeight ||
                        (state === "WIDEST" && y < playArea.height - topLeft.width * 2))
                {
                    y += topLeft.width
                    if(grid.checkIfComplete(x, y, 1))
                    {
                        state = "STOP"
                        //sleep.stop()

                        for(i  = 0; i < 16; i++)
                        {
                            for (j = 0; j < 32; j++)
                            {
                                if (grid.updateGrid(i, j) === true)
                                {
                                    basicShape.visible = false
                                    index = ((j * tilesWide) + i)
                                    //squareRepeater.itemAt(index).visible = true
                                    squareRepeater.itemAt(index).color = "#FFFFFF";
                                    console.log(index)
                                    console.log("i: " + i + " j: " + j)
                                }
                            }
                        }
                       // state = "NARROWEST"
                       // sleep.start()
                    }
                }
                else if(running === false)
                    state = "STOP"
            }
        }

    Square {
    id: topLeft
    color: shapeColor
    anchors.left: parent.left
    anchors.top: parent.top
    }
    Square {
    id: bottomLeft
    anchors.top: thirdLeft.bottom
    anchors.left: parent.left
    color: shapeColor
    }
    Square {
    id: topRight
    anchors.top: parent.top
    anchors.right: parent.right
    color: shapeColor
    }
    Square {
    id: bottomRight
    color: shapeColor
    anchors.top: thirdRight.bottom
    anchors.left: bottomLeft.right
    }
    Square {
    id: secondLeft
    color: shapeColor
    anchors.top: topLeft.bottom
    anchors.left: parent.left
    }
    Square {
    id: secondRight
    color: shapeColor
    anchors.top: topRight.bottom
    anchors.right: parent.right
    }
    Square {
    id: thirdLeft
    color: shapeColor
    anchors.top: secondLeft.bottom
    anchors.right: thirdRight.left
    }
    Square {
    id: thirdRight
    color: shapeColor
    anchors.top: secondRight.bottom
    anchors.right: parent.right
    }
}
