import QtQuick 2.5

TextRect{
    property alias scoreBoard: scoreBoard.visible

    id:scoreBoard

    function updateScoreBoard(score)
    {
        if(score_board.checkHighScore(score))
        {
            doneButton.visible = false;
            score_board.setScore(score)
        }
    }

    anchors.centerIn: parent
    height: appWindow.height * .75
    width: appWindow.width * .85
    x: parent.width * .20
    y: parent.height * .40

    rectangleFont.pointSize: scoreBoard.width * .020
    baseRectangleText.anchors.top: scoreBoardColumns.bottom
    baseRectangleText.anchors.topMargin: scoreBoard.height * .05
    baseRectangleText.anchors.leftMargin: scoreBoard.width * .01
    rectangleText: "1. " + score_board.getName(1) + "      " + score_board.getScore(1) + "\n2. " + score_board.getName(2) + "      "
                   + score_board.getScore(1) + " \n3. " + score_board.getName(3) + "      " + score_board.getScore(3)
    visible: false

    Text {
        id: scoreBoardHeader
        font.bold: true
        font.pointSize: scoreBoard.width * .050
        wrapMode: "WordWrap"
        color: "#b9d6e1"
        text: "HIGH SCORES"
        anchors.top: scoreBoard.top
        anchors.horizontalCenter: scoreBoard.horizontalCenter
        anchors.topMargin: scoreBoard.height * .01
    }

    Text {
        id: scoreBoardColumns
        font.bold: true
        font.pointSize: scoreBoard.width * .025
        wrapMode: "WordWrap"
        color: "#b9d6e1"
        text: "Name      Score"
        anchors.top: scoreBoardHeader.bottom
        anchors.leftMargin: scoreBoard.width * .02
        anchors.topMargin: scoreBoard.height * .06
    }

    Buttons {
        id:doneButton
        anchors.bottom: scoreBoard.bottom
        anchors.bottomMargin: scoreBoard.height * .10
        anchors.horizontalCenter: scoreBoard.horizontalCenter
        mouseArea.onClicked: {
            scoreBoard.visible = false
            gameOver.visible = true
        }
        buttonText : "Done"
    }

    TextInput
    {
        id: txtin_input
        anchors.bottom: scoreBoard.bottom
        anchors.bottomMargin: scoreBoard.height * .15
        anchors.left: scoreBoard.left
        focus: true
        visible: true
        cursorVisible: true
        text: "Enter Name: "
        font.pointSize: scoreBoard.width * .025
        color: "#b9d6e1"
        Keys.onReturnPressed:
        {
            score_board.setName(txtin_input.text)
            doneButton.visible = true
        }
    }
}
