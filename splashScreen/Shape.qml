import QtQuick 2.4

Item {
    property alias topRight:topRight
    property alias topLeft:topLeft
    property alias secondRight:secondRight
    property alias secondLeft:secondLeft
    property alias thirdRight:thirdRight
    property alias thirdLeft:thirdLeft
    property alias bottomRight:bottomRight
    property alias bottomLeft:bottomLeft

    //property alias shapeColor:shapeColor

    width: topLeft.width * 2
    height: topLeft.height * 4
    property color shapeColor: "yellow"
    Square {
    id: topLeft
    color: shapeColor
    }
    Square {
    id: bottomLeft
    anchors.top: thirdLeft.bottom
    color: shapeColor
    }
    Square {
    id: topRight
    anchors.left: topLeft.right
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
    anchors.right: secondRight.left
    }
    Square {
    id: secondRight
    color: shapeColor
    anchors.top: topRight.bottom
    anchors.left: secondLeft.right
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
    anchors.left: thirdLeft.right
    }
}
