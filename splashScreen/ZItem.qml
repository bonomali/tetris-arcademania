
import QtQuick 2.5

Shape {
    id: zItem
    property alias sleep:sleep
    topLeft.visible: false
    thirdRight.visible: false
    bottomLeft.visible: false
    bottomRight.visible: false
    shapeColor: "#ce93d8"
    shapeHeight: topLeft.width * 2
    state: "WIDEST"
    shapeValue: 5
    rotation: 90

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
                state === "WIDEST" && x >= topLeft.width && grid.checkMoveLeft(Math.floor((y + referenceSquare.width) / referenceSquare.width), Math.floor(x/ referenceSquare.width), shapeValue))
                    //x -= topLeft.width
                x = --xCoord * topLeft.width

        }
        else if(event.key === Qt.Key_Right)
        {
            if(state === "NARROWEST" && x < (playArea.width - shapeWidth) && grid.checkMoveRight(Math.floor(y / referenceSquare.width), Math.floor((x - referenceSquare.width)/ referenceSquare.width), shapeValue) ||
                    state === "WIDEST" && x < playArea.width - topLeft.width * 3 && grid.checkMoveRight(Math.floor((y + referenceSquare.width) / referenceSquare.width), Math.floor(x/ referenceSquare.width), shapeValue))
                        //x += topLeft.width
                x = ++xCoord * topLeft.width
        }
        else if(event.key === Qt.Key_Up)
        {
            if(x >= 0 && x < playArea.width - topLeft.width*2)
            {
                if(state === "NARROWEST" && y <= playArea.height - shapeHeight)
                {
                    state = "WIDEST"
                    zItem.rotation = 90
                    zitem.rotate()
                }
                else if(y < playArea.height - shapeHeight && y >= 0 && state === "WIDEST")
                {
                    state = "NARROWEST"
                    zItem.rotation = 0
                    zitem.rotate()
                }
            }
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
            sleep.interval = 1000
            sleep.start()
        }
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
                        }
                        else
                        {
                            squareRepeater.itemAt(index).visible = false
                        }
                    }
                }

                if(state === "NARROWEST" && y < playArea.height - shapeHeight ||
                        (state === "WIDEST" && y < playArea.height - topLeft.width * 2))
                {
//                  y += topLeft.width
                    y += referenceSquare.width
                    yCoord = Math.floor(y / referenceSquare.width)

                    if((state === "WIDEST" && grid.checkIfComplete(Math.floor((y + referenceSquare.width) / referenceSquare.width), Math.floor(x/ referenceSquare.width), shapeValue)) ||
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
//                    x = referenceSquare.width * 6
//                    y = 0
                    xCoord = 6
                    yCoord = 0
                    rotation = 90
                    state = "WIDEST"
                    getRandomIntInclusive(0,6)
                }
            }
        }
}
