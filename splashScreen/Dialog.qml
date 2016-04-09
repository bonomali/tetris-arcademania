import QtQuick 2.4

TextRect{
    property alias dialog:dialog
    property alias diagButtonText:diagButton.buttonText
    property alias diagButtonFont:diagButton.buttonFont
    property alias diagButton: diagButton
    property alias diagMouseArea:diagMouseArea
    property alias drag:diagMouseArea.drag
    property real maximumDragX: 0
    property real maximumDragY: 0

    id:dialog
    signal clicked

    MouseArea{
        id:diagMouseArea
        drag.target: dialog
        anchors.fill: parent
        drag.axis: Drag.XAndYAxis
        drag.minimumX: 0
        drag.maximumX: appWindow.width - dialog.width
        drag.minimumY: 0
        drag.maximumY: appWindow.height - dialog.height
    }

    Buttons {
        id: diagButton
        width: dialog.width * .25
        height: dialog.height * .15
        anchors.bottom: dialog.bottom
        anchors.bottomMargin: dialog.height * .05
        anchors.horizontalCenter: dialog.horizontalCenter
        mouseArea.onClicked: dialog.visible = false
    }
}
