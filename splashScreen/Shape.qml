import QtQuick 2.4

Item {
    id: basicShape
    property alias topRight:topRight
    property alias topLeft:topLeft
    property alias secondRight:secondRight
    property alias secondLeft:secondLeft
    property alias thirdRight:thirdRight
    property alias thirdLeft:thirdLeft
    property alias bottomRight:bottomRight
    property alias bottomLeft:bottomLeft
    property int shapeWidth: topLeft.width * 2
    property int shapeHeight: topLeft.height * 4
    property int row: 0
    property int col: 0
    property int y_wait: 0

    width: topLeft.width * 2
    height: topLeft.height * 4
    property color shapeColor: "yellow"

    focus: true
    Keys.onPressed: {
        if(event.key === Qt.Key_Left && x > 0)
        {
            x -= topLeft.width
        }
        else if(event.key === Qt.Key_Right && x < (playArea.width - shapeWidth))
        {
            x += topLeft.width
        }
        else if(event.key === Qt.Key_Up)
        {
            console.log("move_up")
        }
        else if(event.key === Qt.Key_Down && y < playArea.height - shapeHeight)
        {
            sleep
        }
          event.accept = true
    }

    Keys.onReturnPressed: {
        console.log("we're here")
        cube.rotate()
    }
        Timer
        {
            id:sleep
            interval: 1000
            running: true
            repeat: true
            onTriggered:
            {
                if(y < playArea.height - shapeHeight)
                    y += topLeft.width
                else
                    sleep.stop()
            }
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
