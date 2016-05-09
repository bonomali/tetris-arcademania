import QtQuick 2.5
import QtMultimedia 5.6

Item {
    id: basicShape
    property alias sleep:sleep
    property alias topRight:topRight
    property alias topLeft:topLeft
    property alias secondRight:secondRight
    property alias secondLeft:secondLeft
    property alias thirdRight:thirdRight
    property alias thirdLeft:thirdLeft
    property alias bottomRight:bottomRight
    property alias bottomLeft:bottomLeft
    property alias rotateSound:rotateSound
    property alias impactSound:impactSound
    property int shapeWidth: topLeft.width * 2
    property int shapeHeight: topLeft.height * 4
    property int i: 0
    property int j: 0
    property int index: 0
    property int shapeValue: 0
    property int retval: 0
    property string direction: ""
    property string rightVirtShift: ""
    property string rightHorzShift: ""
    property string leftVirtShift: ""
    property string leftHorzShift: ""
    property string upVirtShift: ""
    property string upHorzShift: ""
    property string downVirtShift: ""
    property string downHorzShift: ""
    property var rotate: (function() {litem.rotate();})
    property color shapeColor: "white"
    property bool fastDrop: false
    property bool fourStates: true
    property bool rotateShape: true
    property int rlBoardHorzShiftNum: 0
    property int rrBoardHorzShiftNum: 0
    property int llBoardHorzShiftNum: 0
    property int lrBoardHorzShiftNum: 0
    property int ulBoardHorzShiftNum: 0
    property int urBoardHorzShiftNum: 0
    property int dlboardHorzShiftNum: 0
    property int drBoardHorzShiftNum: 0

    property int rightBoardVirtShiftNum: 1
    property int leftBoardVirtShiftNum: 1
    property int upBoardVirtShiftNum: 1
    property int downBoardVirtShiftNum: 1

    property int lrRotateShift: 1
    property int rrRotateShift: 1
    property int urRotateShift: 1
    property int drRotateShift: 1

    property int llRotateShift: 0
    property int rlRotateShift: 0
    property int ulRotateShift: 0
    property int dlRotateShift: 0

    width: topLeft.width * 2
    height: topLeft.height * 4
    state: "UPRIGHT"
    rotation: 90
    states: [
           State { name: "UPRIGHT" },
           State { name: "RIGHT" },
           State { name: "UPSIDEDOWN" },
           State { name: "LEFT" },
           State { name: "STOP" }
       ]

        function rotateShift(direction, numBlocks)
        {
            if (direction === "left")
                retval = (x > topLeft.width * numBlocks)
            if (direction === "right")
                retval = (x < playArea.width - topLeft.width * numBlocks)

            return retval
        }

        function borderHorzShift(direction, numBlocks)
        {
            if(direction === "left")
                retval = x > topLeft.width * numBlocks
            else if (direction === "right")
                retval = x < (playArea.width - topLeft.width * numBlocks)
            else
                retval = x > 0

            return retval
        }
        function borderVirtShift(numBlocks)
        {
                return (y < playArea.height - topLeft.width * numBlocks)
        }

        function virtShift(direction)
        {
            if(direction === "up")
                retval = Math.floor((y + topLeft.width) / topLeft.width);
            else if (direction === "down")
                retval = Math.floor((y - topLeft.width) / topLeft.width);
            else
                retval = Math.floor(y/ topLeft.width);

            return retval;
        }
        function horzShift(direction)
        {
            if(direction === "right")
                retval = Math.floor((x + topLeft.width) / topLeft.width);
            else if (direction === "left")
                retval = Math.floor((x - topLeft.width) / topLeft.width);
            else
                retval = Math.floor(x/ topLeft.width);

            return retval;
        }
    Keys.onPressed: {
        if(event.key === Qt.Key_Left)
        {
            if(state === "RIGHT" && borderHorzShift("left", rlBoardHorzShiftNum) && grid.checkMoveLeft(virtShift(rightVirtShift), horzShift(rightHorzShift), shapeValue) ||
                    state == "LEFT" && borderHorzShift("left", llBoardHorzShiftNum) && grid.checkMoveLeft(virtShift(leftVirtShift), horzShift(leftHorzShift), shapeValue) ||
                    state === "UPRIGHT"  && borderHorzShift("left", ulBoardHorzShiftNum) && grid.checkMoveLeft(virtShift(upVirtShift), horzShift(upHorzShift), shapeValue) ||
                    state === "UPSIDEDOWN" && borderHorzShift("left", dlboardHorzShiftNum) && grid.checkMoveLeft(virtShift(downVirtShift), horzShift(downHorzShift), shapeValue))
                x = --xCoord * topLeft.width
        }
        else if(event.key === Qt.Key_Right)
        {
            if(state === "RIGHT" && borderHorzShift("right", rrBoardHorzShiftNum) && grid.checkMoveRight(virtShift(rightVirtShift), horzShift(rightHorzShift), shapeValue) ||
                    state == "LEFT" && borderHorzShift("right", lrBoardHorzShiftNum) && grid.checkMoveRight(virtShift(leftVirtShift), horzShift(leftHorzShift), shapeValue) ||
                    state === "UPRIGHT"  && borderHorzShift("right", urBoardHorzShiftNum) && grid.checkMoveRight(virtShift(upVirtShift), horzShift(upHorzShift), shapeValue) ||
                    state === "UPSIDEDOWN" && borderHorzShift("right", drBoardHorzShiftNum) && grid.checkMoveRight(virtShift(downVirtShift), horzShift(downHorzShift), shapeValue))
                x = ++xCoord * topLeft.width
        }
        else if(event.key === Qt.Key_Up)
        {
            if(rotateShape)
            {
                if(state === "UPRIGHT" && rotateShift("left", ulRotateShift) && rotateShift("right", urRotateShift))
                {
                    state = "RIGHT"
                    rotation = (fourStates) ? 180 : 0
                    if(fourStates)
                        y = --yCoord * topLeft.width
                    rotateSound.play()
                    rotate()
                }
                else if(state === "RIGHT" && rotateShift("left", rlRotateShift) && rotateShift("right", rrRotateShift) &&
                        grid.checkMoveRight(virtShift(rightVirtShift), horzShift(rightHorzShift), shapeValue))
                {
                    state = "UPSIDEDOWN"
                    rotation = (fourStates) ? 270 : 90
                    if (fourStates)
                        x = ++xCoord * topLeft.width
                    rotateSound.play()
                    rotate()
                }
                else if(state === "UPSIDEDOWN" && rotateShift("left", dlRotateShift) && rotateShift("right", drRotateShift))
                {
                    state = "LEFT"
                    rotation = 0
                    if (fourStates)
                        y = ++yCoord * topLeft.width
                    rotateSound.play()
                    rotate()
                }
                else if(state === "LEFT" && rotateShift("left", llRotateShift) && rotateShift("right", lrRotateShift) && grid.checkMoveLeft(virtShift(leftVirtShift), horzShift(leftHorzShift), shapeValue))
                {
                    state = "UPRIGHT"
                    rotation = 90
                    if(fourStates)
                        x = --xCoord * topLeft.width
                    rotateSound.play()
                    rotate()
                }
            }
            console.log(rotation)
            console.log(state)
        }
        else if(event.key === Qt.Key_Down)
        {
            sleep.interval = _speed / 18
        }
        else if(event.key === Qt.Key_Space)
        {
            sleep.interval = _speed / 36
            fastDrop = true
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
//            for(i  = 0; i < 32; i++)
//            {
//                for (j = 0; j < 16; j++)
//                {
//                    index = ((i * tilesWide) + j)
//                    if (grid.updateGrid(i, j) === true)
//                    {
//                        squareRepeater.itemAt(index).visible = true
//                        squareRepeater.itemAt(index).color = grid.getColor(i,j);
//                    }
//                    else
//                    {
//                        squareRepeater.itemAt(index).visible = false
//                    }
//                }
//            }

            if((state === "LEFT" && borderVirtShift(leftBoardVirtShiftNum)) ||
                    (state === "RIGHT" && borderVirtShift(rightBoardVirtShiftNum)) ||
                    (state === "UPRIGHT" && borderVirtShift(upBoardVirtShiftNum)) ||
                    (state === "UPSIDEDOWN" && borderVirtShift(downBoardVirtShiftNum)))
            {
                y += topLeft.width
                yCoord = Math.floor(y / topLeft.width)

                if((state === "UPRIGHT" && grid.checkIfComplete(virtShift(upVirtShift), horzShift(upHorzShift), shapeValue)) ||
                        (state === "UPSIDEDOWN" && grid.checkIfComplete(virtShift(downVirtShift), horzShift(downHorzShift), shapeValue)) ||
                        (state === "RIGHT" && grid.checkIfComplete(virtShift(rightVirtShift), horzShift(rightHorzShift), shapeValue)) ||
                        (state === "LEFT" && grid.checkIfComplete(virtShift(leftVirtShift), horzShift(leftHorzShift), shapeValue)))
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
                x = referenceSquare.width * xCoord
                y = -referenceSquare.height
                rotation = 90
                state = "UPRIGHT"
                localBoard.getRandomIntInclusive(0,6)
                if (fastDrop)
                {
                    fastDrop = false
                    sleep.interval = _speed
                }
            }
        }
    }

    Audio {
        id: rotateSound
        source: "rotate.wav"
        autoLoad: true
    }

    Audio {
        id: impactSound
        source: "impact.wav"
        autoLoad: true
    }

    Square {
    id: topLeft
    color: shapeColor
    anchors.left: parent.left
    anchors.top: parent.top
    }
    Square {
    id: bottomLeft
    anchors.top: thirdLeft.bottom
    anchors.left: parent.left
    color: shapeColor
    }
    Square {
    id: topRight
    anchors.top: parent.top
    anchors.right: parent.right
    color: shapeColor
    }
    Square {
    id: bottomRight
    color: shapeColor
    anchors.top: thirdRight.bottom
    anchors.left: bottomLeft.right
    }
    Square {
    id: secondLeft
    color: shapeColor
    anchors.top: topLeft.bottom
    anchors.left: parent.left
    }
    Square {
    id: secondRight
    color: shapeColor
    anchors.top: topRight.bottom
    anchors.right: parent.right
    }
    Square {
    id: thirdLeft
    color: shapeColor
    anchors.top: secondLeft.bottom
    anchors.right: thirdRight.left
    }
    Square {
    id: thirdRight
    color: shapeColor
    anchors.top: secondRight.bottom
    anchors.right: parent.right
    }
}
