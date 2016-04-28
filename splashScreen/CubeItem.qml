import QtQuick 2.4

Shape {
    property alias sleep:sleep
    bottomLeft.visible: false
    bottomRight.visible: false
    thirdLeft.visible: false
    thirdRight.visible: false
    shapeHeight: topLeft.width * 2
    state: "GO"

    states: [
           State { name: "GO" },
           State { name: "STOP" }
       ]

    Keys.onPressed: {
        if(event.key === Qt.Key_Left)
        {
            if(state === "GO" && x > 0)
                x -= topLeft.width
        }
        else if(event.key === Qt.Key_Right)
        {
            if(state === "GO" && x < (playArea.width - shapeWidth))
                x += topLeft.width
        }
        else if(event.key === Qt.Key_Up)
        {}
        if(event.key === Qt.Key_Down && y < playArea.height - shapeHeight)
        {
            while(Keys.onDownPressed(40))
            {
                console.log("down")
                sleep.interval = 100
            }
            sleep.interval = 1000
        }
        else if(event.key === Qt.Key_Up)
        {
            console.log("up")
            sleep.interval = 1000
        }
        else if(event.key === Qt.Key_Down && y < playArea.height - shapeHeight)
        {
            console.log("down")
            sleep.interval = 100
        }
        else if(event.key === Qt.Key_Up)
        {
            console.log("up")
            sleep.interval = 1000
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
            if(state === "GO" && y < playArea.height - topLeft.width * 2)
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
                running = false
                visible = false
                focus = false
                x = referenceSquare.width * 6
                y = 0
                state = "GO"
                getRandomIntInclusive(0,6)
            }
        }
    }
}

