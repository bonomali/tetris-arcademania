import QtQuick 2.5

Shape {
    property alias sleep:sleep
    topRight.visible: false
    secondRight.visible: false
    bottomLeft.visible: false
    bottomRight.visible: false
    shapeColor: "orange"
    shapeHeight: topLeft.width * 3
    state: "UPRIGHT"
    shapeValue: 3
    rotation: 90

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
                x = --xCoord * topLeft.width
        }
        else if(event.key === Qt.Key_Right)
        {
            if(state === "RIGHT" && x < (playArea.width - shapeWidth) && grid.checkMoveRight(Math.floor((y + referenceSquare.width) / referenceSquare.width), Math.floor(x / referenceSquare.width), shapeValue) ||
                    state == "LEFT" && x < (playArea.width - shapeWidth) && grid.checkMoveRight(Math.floor(y / referenceSquare.width), Math.floor((x - referenceSquare.width) / referenceSquare.width), shapeValue) ||
                    state === "UPRIGHT"  && x < (playArea.width - referenceSquare.width * 3)  && grid.checkMoveRight(Math.floor(y / referenceSquare.width), Math.floor(x/ referenceSquare.width), shapeValue) ||
                    state === "UPSIDEDOWN" && x < (playArea.width - shapeWidth) && grid.checkMoveRight(Math.floor(y / referenceSquare.width), Math.floor((x - referenceSquare.width) / referenceSquare.width), shapeValue))
                x = ++xCoord * topLeft.width
        }
        else if(event.key === Qt.Key_Up)
        {
            if(x < playArea.width - topLeft.width)
            {
                if(state === "UPRIGHT")
                {
                    state = "RIGHT"
                    rotation = 180
                    y = --yCoord * referenceSquare.width
                    rotateSound.play()
                    litem.rotate()
                }
                else if(state === "RIGHT" && x < playArea.width - topLeft.width * 2 &&
                        grid.checkMoveRight(Math.floor((y + referenceSquare.width) / referenceSquare.width), Math.floor(x / referenceSquare.width), shapeValue))
                {
                    state = "UPSIDEDOWN"
                    rotation = 270
                    x = ++xCoord * topLeft.width
                    rotateSound.play()
                    litem.rotate()
                }
                else if(state === "UPSIDEDOWN")
                {
                    state = "LEFT"
                    rotation = 0
                    y = ++yCoord * topLeft.width
                    rotateSound.play()
                    litem.rotate()
                }
                else if(state === "LEFT" && x !== 0 && grid.checkMoveLeft(Math.floor(y / referenceSquare.width), Math.floor((x - referenceSquare.width)/ referenceSquare.width), shapeValue))
                {
                    state = "UPRIGHT"
                    rotation = 90
                    x = --xCoord * topLeft.width
                    rotateSound.play()
                    litem.rotate()
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

    Keys.onReleased: {
        if(event.isAutoRepeat)
        return
        if(event.key === Qt.Key_Down)
        {
            sleep.stop()
            sleep.interval = _speed
            sleep.start()
        }
    }

    Timer
    {
        id:sleep
        interval: _speed
        running: true
        repeat: true
        onTriggered:
        {   // outer bounderies

            for(i  = 0; i < 32; i++)
            {
                for (j = 0; j < 16; j++)
                {
                    index = ((i * tilesWide) + j)
                    if (grid.updateGrid(i, j) === true)
                    {
                        squareRepeater.itemAt(index).visible = true
                        squareRepeater.itemAt(index).color = grid.getColor(i,j);
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
                y += referenceSquare.width
                yCoord = Math.floor(y / referenceSquare.width)

                if((state === "UPRIGHT" && grid.checkIfComplete(Math.floor(y / referenceSquare.width), Math.floor(x / referenceSquare.width), shapeValue)) ||
                        (state === "UPSIDEDOWN" && grid.checkIfComplete(Math.floor(y / referenceSquare.width), Math.floor((x - referenceSquare.width) / referenceSquare.width), shapeValue)) ||
                        (state === "RIGHT" && grid.checkIfComplete(Math.floor((y + referenceSquare.width) / referenceSquare.width), Math.floor(x / referenceSquare.width), shapeValue)) ||
                        (state === "LEFT" && grid.checkIfComplete(Math.floor(y / referenceSquare.width), Math.floor((x - referenceSquare.width) / referenceSquare.width), shapeValue)))
                {
                    if(state != "GAMEOVER")
                    {
                        impactSound.play()
                        state = "STOP"
                    }

                    for(i  = 0; i < 32; i++)
                    {
                        for (j = 0; j < 16; j++)
                        {
                            index = ((i * tilesWide) + j)
                            if (grid.updateGrid(i, j) === true)
                            {
                                squareRepeater.itemAt(index).visible = true
                                squareRepeater.itemAt(index).color = grid.getColor(i,j);
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
                xCoord = 6
                yCoord = 0
                rotation = 90
                state = "UPRIGHT"
                getRandomIntInclusive(0,6)
            }
        }
    }
}
