import QtQuick 2.5

Shape {
    property alias sleep:sleep
    bottomLeft.visible: false
    bottomRight.visible: false
    thirdLeft.visible: false
    thirdRight.visible: false
    shapeHeight: topLeft.width * 2
    shapeValue: 0
    state: "GO"

    states: [
           State { name: "GO" },
           State { name: "STOP" }
       ]

    Keys.onPressed: {
        if(event.key === Qt.Key_Up)
        {
            rotateSound.play()
        }
        else if(event.key === Qt.Key_Left)
        {
            if(state === "GO" && x > 0 && grid.checkMoveLeft(Math.floor((y - referenceSquare.width)/ referenceSquare.width), Math.floor((x - referenceSquare.width)/ referenceSquare.width), shapeValue))
                x = --xCoord * topLeft.width
        }
        else if(event.key === Qt.Key_Right)
        {
            if(state === "GO" && x < (playArea.width - shapeWidth)&& grid.checkMoveRight(Math.floor((y - referenceSquare.width) / referenceSquare.width), Math.floor((x - referenceSquare.width)/ referenceSquare.width), shapeValue))
                x = ++xCoord * topLeft.width
        }
        else if(event.key === Qt.Key_Down)
        {
            sleep.interval = _speed / 18
        }
        else if(event.key === Qt.Key_Space)
        {
            sleep.interval = _speed / 36
        }

        event.accept = true
    }

Keys.onReleased: {
    if(event.key === Qt.Key_Down && !event.isAutoRepeat)
        sleep.interval = _speed
}

    Timer
    {
        id:sleep
        interval: _speed
        running: true
        repeat: true
        onTriggered:
        {
            if(state === "GO" && y < playArea.height - topLeft.width * 2)
            {
                y = localBoard.yCoord++ * topLeft.width

                if(grid.checkIfComplete(Math.floor((y - referenceSquare.width) / referenceSquare.width), Math.floor((x - referenceSquare.width) / referenceSquare.width), shapeValue))
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
                            if (grid.updateGrid(i, j) === true)
                            {
                                index = ((i * tilesWide) + j)
                                squareRepeater.itemAt(index).visible = true
                                squareRepeater.itemAt(index).color = grid.getColor(i,j);
                            }
                            else
                            {
                                index = ((i * tilesWide) + j)
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
                xCoord = 6
                yCoord = 0
                state = "GO"
                getRandomIntInclusive(0,6)
            }
        }
    }
}

