import QtQuick 2.5

Shape {
    id:mZItem
    property alias sleep:sleep
    topRight.visible: false
    bottomRight.visible: false
    thirdLeft.visible: false
    bottomLeft.visible: false
    shapeColor: "#7FFFD4"
    shapeHeight: topLeft.width * 2
    state: "WIDEST"
    shapeValue: 6
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
            if(state === "NARROWEST" && x > 0 && grid.checkMoveLeft(Math.floor((y + referenceSquare.width) / referenceSquare.width), Math.floor((x - referenceSquare.width)/ referenceSquare.width), shapeValue) ||
                state === "WIDEST" && x >= topLeft.width && grid.checkMoveLeft(Math.floor((y + referenceSquare.width) / referenceSquare.width), Math.floor(x/ referenceSquare.width), shapeValue))
                    x -= topLeft.width
        }
        else if(event.key === Qt.Key_Right)
        {
            if(state === "NARROWEST" && x < (playArea.width - shapeWidth) && grid.checkMoveRight(Math.floor((y + referenceSquare.width) / referenceSquare.width), Math.floor((x - referenceSquare.width)/ referenceSquare.width), shapeValue) ||
                    state === "WIDEST" && x < playArea.width - topLeft.width * 3 && grid.checkMoveRight(Math.floor((y + referenceSquare.width) / referenceSquare.width), Math.floor(x/ referenceSquare.width), shapeValue))
                        x += topLeft.width
        }
        else if(event.key === Qt.Key_Up)
        {
            if(x >= 0 && x < playArea.width - topLeft.width*2)
            {
                if(state === "NARROWEST" && y <= playArea.height - shapeHeight)
                {
                    state = "WIDEST"
                    mZItem.rotation = 90
                    mzitem.rotate()
                }
                else if(y < playArea.height - shapeHeight && y >= 0 && state === "WIDEST")
                {
                    state = "NARROWEST"
                    mZItem.rotation = 0
                    y += referenceSquare.width
                    mzitem.rotate()
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
                if(state === "NARROWEST" && y < playArea.height - shapeHeight ||
                        (state === "WIDEST" && y < playArea.height - topLeft.width * 2))
                {
                    y += topLeft.width

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
                            }
                        }
                    }
                }
                else if(state === "STOP")
                {
                    running = false
                    visible = false
                    x = referenceSquare.width * 6
                    y = 0
                    rotation = 90
                    state = "WIDEST"
                    getRandomIntInclusive(0,3)
                }
            }
        }
}
