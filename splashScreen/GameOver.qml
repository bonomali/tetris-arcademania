import QtQuick 2.0
    Dialog{
        property alias gameOver: gameOver.visible
        id:gameOver
        height: parent.height * .2
        width: parent.width * .57
        x: parent.width * .20
        y: parent.height * .40
        rectangleFont.pointSize: height * .09
        baseRectangleText.anchors.centerIn: gameOver
        diagButtonFont.pointSize: height * .07
        rectangleText: "GAME OVER LOSER :P!"
        diagButtonText: "Again?"
        visible: false
}
