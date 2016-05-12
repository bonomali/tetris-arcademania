import QtQuick 2.5
    Dialog{
        property alias gameOver: gameOver.visible

        id:gameOver
        height: appWindow.height * .2
        width: appWindow.width * .57
        x: parent.width * .20
        y: parent.height * .40
        rectangleFont.pointSize: height * .09
        baseRectangleText.anchors.centerIn: gameOver
        diagButtonFont.pointSize: height * .07
        rectangleText: "GAME OVER LOSER :P!"
        diagButtonText: "Again?"
        diagButton2Text: "Exit"
        diagButton2Font.pointSize: height * .07
        diagButton2Mouse.onClicked: Qt.quit()
        diagButtonMouse.onClicked: {
            minutes = 0
            seconds = 0
            playTimer.restart()
            appWindow.initializeBoard1.initializeBoard()
            _level = 1
            _score = 0
        }

        visible: false
}
