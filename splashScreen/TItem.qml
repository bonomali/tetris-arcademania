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
    state: "WIDEST"
    rotation: 90

    states: [
           State { name: "WIDEST" },
           State { name: "UPSIDEDOWN" },
           State { name: "NODERIGHT" },
           State { name: "NODELEFT" },
           State { name: "STOP" }
       ]

    Keys.onPressed: {
        if(event.key === Qt.Key_Left)
        {
            if((state === "NODERIGHT" || state === "NODELEFT") && x > 0 ||
                state === "WIDEST"  && x >= topLeft.width ||
                    state === "UPSIDEDOWN" && x > topLeft.width)
                    x -= topLeft.width
        }
        else if(event.key === Qt.Key_Right)
        {
            if((state === "NODERIGHT" || state === "NODELEFT") && x < playArea.width - shapeWidth ||
                    state === "WIDEST" && x < playArea.width - topLeft.width * 3 ||
                        state === "UPSIDEDOWN" && x <= playArea.width - topLeft.width * 3)
                        x += topLeft.width
        }
        else if(event.key === Qt.Key_Up)
        {
            if(x > 0 && x < playArea.width - topLeft.width*3)
            {
                if(state === "NODELEFT" && y <= playArea.height - shapeHeight)
                {
                    rot = 270
                    state = "UPSIDEDOWN"
                    tItem.rotation = rot
                    titem.rotate()
                }
                else if(state === "NODERIGHT" && y <= playArea.height - shapeHeight)
                {
                    rot = 90
                    state = "WIDEST"
                    tItem.rotation = rot
                    titem.rotate()
                }
                else if(state === "WIDEST" && y <= playArea.height - shapeHeight)
                {
                    rot = 180
                    state = "NODELEFT"
                    tItem.rotation = rot
                    titem.rotate()
                }
                else if(state === "UPSIDEDOWN" && y <= playArea.height - shapeHeight)
                {
                    rot = 0
                    state = "NODERIGHT"
                    tItem.rotation = rot
                    titem.rotate()
                }
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
                if(state === "NODERIGHT" || state === "NODELEFT" && y < playArea.height - shapeHeight ||
                        (state === "WIDEST" || state === "UPSIDEDOWN" && y < playArea.height - topLeft.width * 2))
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
                    x: referenceSquare.width * 6
                    y: 0
                    state = "WIDEST"
                }
            }
        }
        onStateChanged:
        {
            if(state === "STOP")
                getRandomIntInclusive(0,6)
                console.log("new shape")
        }

}
