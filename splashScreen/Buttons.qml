import QtQuick 2.4
import QtQuick.Controls 1.3

Rectangle {
    property alias mouseArea:mouseArea
    property alias buttonText:buttonText.text
    property alias buttonFont:buttonText.font

    id:myButton
    height: parent.height * .15; width: parent.width * .35
    color: "#014880"

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {myButton.color = "#015394"}
        onExited: {myButton.color = "#014880"}
        onClicked: {myButton.color = "#00aaff"}
    }
    Text{
       id:buttonText
       font.pointSize: 15
       font.bold: true
       anchors.centerIn:parent
       color: "#b9d6e1"
    }
}
