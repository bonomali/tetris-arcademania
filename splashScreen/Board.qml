import QtQuick 2.4

Rectangle {
    property alias playArea:playArea
    id: playArea
    color: "black"
    anchors.bottom: parent.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    height: referenceSquare.height * 32
    width: referenceSquare.width * 16

    Square{
        id:referenceSquare
        color:"transparent"
    }
}
