import QtQuick 2.4

TextRect{
    property alias dialog:dialog
    property alias diagButton:diagButton
    id:dialog
    height: parent.height * .8
    width: parent.width * .85
    anchors.centerIn: parent

    Buttons {
        id: diagButton
        width: dialog.width * .25
        height: dialog.height * .15
        anchors.bottom: dialog.bottom
        anchors.bottomMargin: dialog.height * .02
        anchors.horizontalCenter: dialog.horizontalCenter
        mouseArea.onClicked: dialog.visible = false
    }
}
