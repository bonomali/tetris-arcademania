import QtQuick 2.0

Rectangle {
    property alias playArea:playArea
    id: playArea
    color: "black"
    anchors.bottom: parent.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    height: baseSquare.height * 32
    width: baseSquare.width * 16
}
