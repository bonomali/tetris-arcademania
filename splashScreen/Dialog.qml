import QtQuick 2.5

TextRect{
    property alias dialog:dialog
    property alias diagButtonText:diagButton.buttonText
    property alias diagButtonFont:diagButton.buttonFont
    property alias diagButtonMouse:diagButton.mouseArea
    property alias diagButton2Text:diagButton2.buttonText
    property alias diagButton2Font:diagButton2.buttonFont
    property alias diagButton2Mouse:diagButton2.mouseArea
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
        anchors.left: dialog.left
        anchors.leftMargin: dialog.width * .19
        mouseArea.onClicked: dialog.visible = false
    }

    Buttons {
        id: diagButton2
        width: dialog.width * .25
        height: dialog.height * .15
        anchors.bottom: dialog.bottom
        anchors.bottomMargin: dialog.height * .05
        anchors.left: diagButton.right
        anchors.leftMargin: diagButton.width * .50
        mouseArea.onClicked: dialog.visible = false
    }
}
