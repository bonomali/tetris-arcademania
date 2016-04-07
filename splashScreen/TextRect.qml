import QtQuick 2.4

Rectangle {
    property alias textRect:textRect
    property alias rectText:rectText
    id: textRect
    border.color: "grey"
    color: "lightblue"

    Text {
        id: rectText
        font.pointSize: textRect.height * .03
        font.bold: true
        width: textRect.width * .90
        height: textRect.height * .85
        anchors.centerIn: textRect
        wrapMode: "WordWrap"
    }
}
