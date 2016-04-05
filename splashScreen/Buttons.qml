import QtQuick 2.4
import QtQuick.Controls 1.3

Button {
    id:iButton
    property alias mouseArea:mouseArea
    height: parent.height * .15; width: parent.width * .35

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        //onClicked: iButton.visible = false //??? Doesn't disappear
        hoverEnabled: iButton.color = "blue"
        //???(hoverDisabled).iButton.color = "red"
    }
}
