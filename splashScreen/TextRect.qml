import QtQuick 2.4

Rectangle {
    property alias textRect:textRect
    property alias rectangleText:rectangleText.text
    property alias rectangleFont:rectangleText.font
    property alias baseRectangleText:rectangleText

    id: textRect
    border.color: "grey"
    color: "lightblue"

    Text {
        id: rectangleText
        font.bold: true
        wrapMode: "WordWrap"
    }
}
