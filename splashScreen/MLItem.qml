import QtQuick 2.5

Shape {
    property alias sleep:sleep
    secondRight.visible: false
    thirdRight.visible: false
    bottomLeft.visible: false
    bottomRight.visible: false
    shapeColor: "#f06292"
    shapeHeight: topLeft.width * 3
    state: "UPRIGHT"
    shapeValue: 4
    rotation: 90
    Component.onCompleted: console.log(state)
    states: [
           State { name: "UPRIGHT" },
           State { name: "RIGHT" },
           State { name: "UPSIDEDOWN" },
           State { name: "LEFT" },
           State { name: "STOP" }
       ]

    focus: true
    Keys.onPressed: {
        if(event.key === Qt.Key_Left)
        {
            if(state === "RIGHT" && x > 0 && grid.checkMoveLeft(Math.floor((y + referenceSquare.width) / referenceSquare.width), Math.floor(x / referenceSquare.width), shapeValue) ||
                    state == "LEFT" && x > 0 && grid.checkMoveLeft(Math.floor(y / referenceSquare.width), Math.floor((x - referenceSquare.width)/ referenceSquare.width), shapeValue) ||
                    state === "UPRIGHT"  && x >= topLeft.width  && grid.checkMoveLeft(Math.floor(y / referenceSquare.width), Math.floor(x/ referenceSquare.width), shapeValue) ||
                    state === "UPSIDEDOWN" && x > topLeft.width && grid.checkMoveLeft(Math.floor(y / referenceSquare.width), Math.floor((x - referenceSquare.width)/ referenceSquare.width), shapeValue))
                    x -= topLeft.width
        }
        else if(event.key === Qt.Key_Right)
        {
            if(state === "RIGHT" && x < (playArea.width - shapeWidth) && grid.checkMoveRight(Math.floor((y + referenceSquare.width) / referenceSquare.width), Math.floor(x / referenceSquare.width), shapeValue) ||
                    state == "LEFT" && x < (playArea.width - shapeWidth) && grid.checkMoveRight(Math.floor(y / referenceSquare.width), Math.floor((x - referenceSquare.width)/ referenceSquare.width), shapeValue) ||
                    state === "UPRIGHT"  && x < (playArea.width - referenceSquare.width * 3)  && grid.checkMoveRight(Math.floor(y / referenceSquare.width), Math.floor(x / referenceSquare.width), shapeValue) ||
                    state === "UPSIDEDOWN" && x < (playArea.width - shapeWidth) && grid.checkMoveRight(Math.floor(y / referenceSquare.width), Math.floor((x + referenceSquare.width)/ referenceSquare.width), shapeValue))
                        x += topLeft.width
        }
        else if(event.key === Qt.Key_Up)
        {
            if(x !== 0 && x < playArea.width - topLeft.width * 2)
            {
                if(state === "UPRIGHT" && y < playArea.height - shapeHeight)
                {
                    state = "RIGHT"
                    rotation = 180
                    x += topLeft.width
                    mlitem.rotate()
                }
                else if(state === "RIGHT" && y <= playArea.height - shapeHeight)
                {
                    state = "UPSIDEDOWN"
                    rotation = 270
                    y += topLeft.width
                    mlitem.rotate()
                }
                else if(state === "UPSIDEDOWN" && y <= playArea.height - shapeHeight)
                {
                    state = "LEFT"
                    rotation = 0
                    x -= topLeft.width
                    mlitem.rotate()
                }
                else if(state === "LEFT" && y <= playArea.height - shapeHeight)
                {
                    state = "UPRIGHT"
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
            for(i  = 0; i < 32; i++)
            {
                for (j = 0; j < 16; j++)
                {
                    index = ((i * tilesWide) + j)

                    if (grid.updateGrid(i, j) === true)
                    {
                        squareRepeater.itemAt(index).visible = true
                        squareRepeater.itemAt(index).color = grid.getColor(i,j);
                        console.log(index)
                    }
                    else
                    {
                        squareRepeater.itemAt(index).visible = false
                    }
                }
            }

            if((state === "LEFT" && y < playArea.height - shapeHeight) ||
                    (state === "RIGHT" && y < playArea.height - referenceSquare.width * 4) ||
                    ((state === "UPRIGHT" || state === "UPSIDEDOWN" )&& y < playArea.height - topLeft.width * 3))
            {
                y += topLeft.width
                if((state === "UPRIGHT" && grid.checkIfComplete(Math.floor(y / referenceSquare.width), Math.floor(x / referenceSquare.width), shapeValue)) ||
                        (state === "UPSIDEDOWN" && grid.checkIfComplete(Math.floor((y + referenceSquare.width) / referenceSquare.width), Math.floor((x - referenceSquare.width) / referenceSquare.width), shapeValue)) ||
                        (state === "RIGHT" && grid.checkIfComplete(Math.floor((y + referenceSquare.width) / referenceSquare.width), Math.floor(x / referenceSquare.width), shapeValue)) ||
                        (state === "LEFT" && grid.checkIfComplete(Math.floor(y / referenceSquare.width), Math.floor((x - referenceSquare.width) / referenceSquare.width), shapeValue)))
                {
                    if(state != "GAMEOVER")
                       state = "STOP"

                    for(i  = 0; i < 32; i++)
                    {
                        for (j = 0; j < 16; j++)
                        {
                            index = ((i * tilesWide) + j)

                            if (grid.updateGrid(i, j) === true)
                            {
                                squareRepeater.itemAt(index).visible = true
                                squareRepeater.itemAt(index).color = grid.getColor(i,j);
                                console.log(index)
                            }
                            else
                            {
                                squareRepeater.itemAt(index).visible = false
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
                state = "UPRIGHT"
                getRandomIntInclusive(0,6)
            }
        }
    }
}
