import QtQuick 2.4

Shape {
    id:lineItem
    property alias sleep:sleep
    topRight.visible: false
    secondRight.visible: false
    thirdRight.visible: false
    bottomRight.visible: false
    shapeColor: "red"
    shapeWidth: topLeft.width
    state: "WIDEST"
    rotation: 90

    states: [
           State { name: "WIDEST" },
           State { name: "NARROWEST" },
           State { name: "STOP" }
       ]
    focus: true
    Keys.onPressed: {
        if(event.key === Qt.Key_Left)
        {
            if(state === "NARROWEST" && x > 0 ||
                state === "WIDEST" && x > topLeft.width)
                    x -= topLeft.width
        }
        else if(event.key === Qt.Key_Right)
        {
            if(state === "NARROWEST" && x < (playArea.width - shapeWidth) ||
                    state === "WIDEST" && x < playArea.width - topLeft.width * 3)
                        x += topLeft.width
        }
        else if(event.key === Qt.Key_Up)
        {
            if(x != 0 && x < playArea.width - topLeft.width * 2)
            {
                if(rot === 0 && state === "NARROWEST" && y <= playArea.height - shapeHeight)
                {
                    rot = 90
                    state = "WIDEST"
                    lineItem.rotation = rot
                    line.rotate()
                }
                else if(y < playArea.height - shapeHeight && state === "WIDEST")
                {
                    rot = 0
                    state = "NARROWEST"
                    lineItem.rotation = rot
                    line.rotate()
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
                }
            }
        }
}
