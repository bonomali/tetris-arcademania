import QtQuick 2.4

Shape {
    property alias sleep:sleep
    topLeft.visible: false
    secondLeft.visible: false
    bottomLeft.visible: false
    bottomRight.visible: false
    shapeColor: "#f06292"
    shapeHeight: topLeft.width * 3
    state: "RIGHT"
    rotation: 90

    states: [
           State { name: "RIGHT" },
           State { name: "UPSIDEDOWN" },
           State { name: "LEFT" },
           State { name: "UPRIGHT" },
           State { name: "STOP" }
       ]

    focus: true
    Keys.onPressed: {
        if(event.key === Qt.Key_Left)
        {
            if(((state === "UPSIDEDOWN" || state === "UPRIGHT" ) && x > 0) ||
                (state === "RIGHT" && x >= topLeft.width) ||
                    state === "LEFT" && x > topLeft.width)
                    x -= topLeft.width
        }
        else if(event.key === Qt.Key_Right)
        {
            if((state === "UPSIDEDOWN" || state === "UPRIGHT") && x < (playArea.width - shapeWidth) ||
                    state === "RIGHT" && x < playArea.width - topLeft.width * 3 ||
                    state === "LEFT" && x < playArea.width - topLeft.width * 2)
                        x += topLeft.width
        }
        else if(event.key === Qt.Key_Up)
        {
            if(x !== 0 && x < playArea.width - topLeft.width * 2)
            {
                if(state === "RIGHT" && y < playArea.height - shapeHeight)
                {
                    state = "UPSIDEDOWN"
                    rotation = 180
                    x += topLeft.width
                    mlitem.rotate()
                }
                else if(state === "UPSIDEDOWN" && y <= playArea.height - shapeHeight)
                {
                    state = "LEFT"
                    rotation = 270
                    y += topLeft.width
                    mlitem.rotate()
                }
                else if(state === "LEFT" && y <= playArea.height - shapeHeight)
                {
                    state = "UPRIGHT"
                    rotation = 0
                    x -= topLeft.width
                    mlitem.rotate()
                }
                else if(state === "UPRIGHT" && y <= playArea.height - shapeHeight)
                {
                    state = "RIGHT"
                    rotation = 90
                    y -= topLeft.width
                    mlitem.rotate()
                }
            }
            console.log(state)
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
            if((state === "UPRIGHT" && y < playArea.height - shapeHeight) ||
                    (state === "UPSIDEDOWN" && y < playArea.height - topLeft.width * 4) ||
                    ((state === "RIGHT" || state === "LEFT" )&& y < playArea.height - topLeft.width * 3))
            {
                y += topLeft.width
                if(grid.checkIfComplete(Math.floor(y / topLeft.width), Math.floor(x / topLeft.width), shapeValue))
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
                running = false
                visible = false
                focus = false
                x = topLeft.width * 6
                y = 0
                rotation = 90
                state = "RIGHT"
                getRandomIntInclusive(0,6)
            }
        }
    }
}
