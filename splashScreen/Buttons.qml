import QtQuick 2.4
import QtQuick.Controls 1.3

Rectangle {
    property alias mouseArea:mouseArea
    property alias buttonText:buttonText.text
    property alias buttonFont:buttonText.font

    id:myButton
    height: parent.height * .15; width: parent.width * .35

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {myButton.color = "LightGrey"}
        onExited: {myButton.color = "White"}
        onClicked: {myButton.color = "Grey"}
    }
    Text{
       id:buttonText
       font.pointSize: 15
       font.bold: true
       anchors.centerIn:parent
    }
}
