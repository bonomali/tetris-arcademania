import QtQuick 2.4

Shape {
    id:lineItem
    property alias sleep:sleep
    topRight.visible: false
    secondRight.visible: false
    thirdRight.visible: false
    bottomRight.visible: false
    shapeColor: "#ff0000"
    shapeWidth: topLeft.width
    state: "WIDEST"
    rotation: 90
    shapeValue: 1

    states: [
           State { name: "WIDEST" },
           State { name: "NARROWEST" },
           State { name: "STOP" },
           State { name: "GAMEOVER" }
       ]

    Keys.onPressed: {
        if(event.key === Qt.Key_Left)
        {
            if(state === "NARROWEST" && x > 0 && grid.checkMoveLeft(Math.floor(y / referenceSquare.width), Math.floor((x - referenceSquare.width)/ referenceSquare.width), shapeValue) ||
                state === "WIDEST" && x > topLeft.width && grid.checkMoveLeft(Math.floor((y + referenceSquare.width) / referenceSquare.width), Math.floor((x - referenceSquare.width)/ referenceSquare.width), shapeValue))
                    x -= topLeft.width
            console.log("x: " + ((x - referenceSquare.width)/ referenceSquare.width))
        }
        else if(event.key === Qt.Key_Right)
        {
            if(state === "NARROWEST" && x < (playArea.width - shapeWidth) && grid.checkMoveRight(Math.floor(y / referenceSquare.width), Math.floor((x - referenceSquare.width)/ referenceSquare.width), shapeValue)||
                    state === "WIDEST" && x < playArea.width - topLeft.width * 3 && grid.checkMoveRight(Math.floor((y + referenceSquare.width) / referenceSquare.width), Math.floor((x - referenceSquare.width)/ referenceSquare.width), shapeValue))
                        x += topLeft.width
        }
        else if(event.key === Qt.Key_Up)
        {
            if(x != 0 && x < playArea.width - topLeft.width * 2)
            {
                if(state === "NARROWEST" && y <= playArea.height - shapeHeight)
                {
                    state = "WIDEST"
                    lineItem.rotation = 90
                    line.rotate()
                }
                else if(y < playArea.height - shapeHeight && y >= 0 && state === "WIDEST")
                {
                    state = "NARROWEST"
                    lineItem.rotation = 0
                    line.rotate()
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
                if(state === "NARROWEST" && y < playArea.height - shapeHeight ||
                        (state === "WIDEST" && y < playArea.height - topLeft.width * 2))
                {
                    //console.log(Math.floor((y + referenceSquare.width) / referenceSquare.width), Math.floor(x / referenceSquare.width))

                    //console.log(x)
                    //console.log(y)

                    y += topLeft.width

                    if((state === "WIDEST" && grid.checkIfComplete(Math.floor((y + referenceSquare.width) / referenceSquare.width), Math.floor((x - referenceSquare.width)/ referenceSquare.width), shapeValue)) ||
                            (state === "NARROWEST" && grid.checkIfComplete(Math.floor(y / referenceSquare.width), Math.floor((x - referenceSquare.width)/ referenceSquare.width), shapeValue)))
                    {
                        if(state != "GAMEOVER")
                            state = "STOP"

                        for(i  = 0; i < 32; i++)
                        {
                            for (j = 0; j < 16; j++)
                            {
                                if (grid.updateGrid(i, j) === true)
                                {
                                    //console.log("i: " + i + "j: " + j)
                                    index = ((i * tilesWide) + j)
                                    squareRepeater.itemAt(index).visible = true
                                    squareRepeater.itemAt(index).color = grid.getColor(i,j);
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
                    x = referenceSquare.width * 6
                    y = 0
                    rotation = 90
                    state = "WIDEST"
                    getRandomIntInclusive(0,3)
                }
            }
        }
}
