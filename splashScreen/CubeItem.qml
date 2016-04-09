import QtQuick 2.0

Rectangle {
    width: baseSquare.width * 2
    height: baseSquare.height * 2

    Square {
    id: topLeft
    anchors.right: topRight.left
    color: "blue"
    }
    Square {
    id: bottomLeft
    anchors.top: topLeft.bottom
    color: "blue"
    }
    Square {
    id: topRight
    anchors.bottom: bottomRight.top
    color: "blue"
    }
    Square {
    id: bottomRight
    color: "blue"
    anchors.left: bottomLeft.right
    }
}

