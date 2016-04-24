import QtQuick 2.4

Shape {
    id: tItem
    property alias sleep:sleep
    bottomLeft.visible: false
    bottomRight.visible: false
    thirdRight.visible: false
    topRight.visible: false
    shapeColor: "#FFBF00"
    shapeHeight: topLeft.width * 3
    state: "UPRIGHT"
    rotation: 90

    states: [
           State { name: "UPRIGHT" },
           State { name: "UPSIDEDOWN" },
           State { name: "RIGHT" },
           State { name: "LEFT" },
           State { name: "STOP" }
       ]

    Keys.onPressed: {
        if(event.key === Qt.Key_Left)
        {
            if((state === "RIGHT" || state === "LEFT") && x > 0 ||
                state === "UPRIGHT"  && x >= topLeft.width ||
                    state === "UPSIDEDOWN" && x > topLeft.width)
                    x -= topLeft.width
        }
        else if(event.key === Qt.Key_Right)
        {
            if((state === "RIGHT" || state === "LEFT") && x < playArea.width - shapeWidth ||
                    state === "UPRIGHT" && x < playArea.width - topLeft.width * 3 ||
                        state === "UPSIDEDOWN" && x <= playArea.width - topLeft.width * 3)
                        x += topLeft.width
        }
        else if(event.key === Qt.Key_Up)
        {
            if(x >= 0 && x < playArea.width - topLeft.width)
            {
                if(state === "UPRIGHT" && y <= playArea.height - shapeHeight)
                {
                    state = "LEFT"
                    rotation = 180
                    titem.rotate()
                }
                else if(state === "LEFT" && y <= playArea.height - shapeHeight &&
                        x < playArea.width - topLeft.width * 2)
                {
                    state = "UPSIDEDOWN"
                    x += referenceSquare.width
                    rotation = 270
                    titem.rotate()
                }
                else if(state === "UPSIDEDOWN" && y <= playArea.height - shapeHeight &&
                        x >= 0)
                {
                    state = "RIGHT"
                    rotation = 0
                    y += referenceSquare.width
                    titem.rotate()
                }
                else if(state === "RIGHT" && y <= playArea.height - shapeHeight &&  x > 0)
                {
                    state = "UPRIGHT"
                    rotation = 90
                    x -= referenceSquare.width
                    titem.rotate()
                }
                console.log(state)
            }
        }
        else if(event.key === Qt.Key_Down && y < playArea.height - shapeHeight)
        {
            sleep.interval = 100
        }
        event.accept = true
    }

        Timer
        {
            id:sleep
            interval: 1000
            running: true
            repeat: true
            onTriggered:
            {
                if(state === "RIGHT" || state === "LEFT" && y < playArea.height - shapeHeight ||
                        (state === "UPRIGHT" || state === "UPSIDEDOWN" && y < playArea.height - topLeft.width * 2))
                {
                    y += topLeft.width
                    if(grid.checkIfComplete(Math.floor(y / referenceSquare.width), Math.floor(x / referenceSquare.width), shapeValue))
                    {
                        state = "STOP"

                        for(i  = 0; i < 32; i++)
                        {
                            for (j = 0; j < 16; j++)
                            {
                                if (grid.updateGrid(i, j) === true)
                                {
                                    index = ((i * tilesWide) + j)
                                    squareRepeater.itemAt(index).visible = true
                                    squareRepeater.itemAt(index).color = grid.getColor(0,0);
                                    console.log(index)
                                    console.log("i: " + i + " j: " + j)
                                }
                            }
                        }
                    }
                }
                else if(state === "STOP")
                {
                    console.log(state)
                    running = false
                    visible = false
                    x = referenceSquare.width * 6
                    y = 0
                    rotation = 90
                    state = "UPRIGHT"
                    console.log(state)
                    getRandomIntInclusive(0,6)
                }
            }
        }
//        onStateChanged:
//        {
//            if(state === "STOP")
//            {
//                getRandomIntInclusive(0,6)
//                console.log("new shape")
//                //state = "UPRIGHT"
//            }
//        }

}
