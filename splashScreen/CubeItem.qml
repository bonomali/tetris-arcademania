import QtQuick 2.0

Item {
    width: topLeft.width * 2
    height: topLeft.height * 2
    property color shapeColor: "blue"
    Square {
    id: topLeft
    color: shapeColor
    }
    Square {
    id: bottomLeft
    anchors.top: topLeft.bottom
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
    anchors.top: topRight.bottom
    anchors.left: bottomLeft.right
    }
}

