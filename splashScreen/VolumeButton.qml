import QtQuick 2.5

Item {
    id: volumeButton
    anchors.fill: parent
    property bool isMuted: false
    property bool hovered: false

    Image{
        id: volumeIcon
        source: "volume-down.png"
        anchors.right: parent.right
        anchors.rightMargin: parent.width * .025
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.width * .025
        width: parent.height * 0.05
        height: parent.height * 0.05
        visible: !isMuted
    }
    Image{
        id: volumeIconPressed
        source: "volume-downPressed.png"
        anchors.right: parent.right
        anchors.rightMargin: parent.width * .025
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.width * .025
        width: parent.height * 0.05
        height: parent.height * 0.05
        visible: !isMuted && hovered
    }

    Image{
        source: "volume-mute.png"
        anchors.right: parent.right
        anchors.rightMargin: parent.width * .025
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.width * .025
        width: parent.height * 0.05
        height: parent.height * 0.05
        visible: isMuted
    }
    Image{
        source: "volume-mutePressed.png"
        anchors.right: parent.right
        anchors.rightMargin: parent.width * .025
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.width * .025
        width: parent.height * 0.05
        height: parent.height * 0.05
        visible: isMuted && hovered
    }

    MouseArea{
        anchors.fill: volumeIcon
        onPressed: isMuted = !isMuted
        onEntered: hovered = true
        onExited: hovered = false
        hoverEnabled: true

    }
}
