import QtQuick 2.0

Item {
    width: topLeft.width * 2
    height: topLeft.height * 2
    //color: "transparent"

    Square {
    id: topLeft
    color: "blue"
    }
    Square {
    id: bottomLeft
    anchors.top: topLeft.bottom
    color: "blue"
    }
    Square {
    id: topRight
    anchors.left: topLeft.right
    color: "blue"
    }
    Square {
    id: bottomRight
    color: "blue"
    anchors.top: topRight.bottom
    anchors.left: bottomLeft.right
    }
}

