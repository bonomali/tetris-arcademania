import QtQuick 2.5

TextRect{
    property alias scoreBoard: scoreBoard.visible
    property int listBullets: 1
    id:scoreBoard

    function updateScoreBoard(score)
    {
        score_board.writeToFile()
        score_board.readFromFile()
//        if(score_board.checkHighScore(score))
//        {
//            doneButton.visible = false;
//            score_board.setScore(score)
//        }
    }

    anchors.centerIn: parent
    height: appWindow.height * .75
    width: appWindow.height * .85
    x: parent.width * .20
    y: parent.height * .40

    rectangleFont.pointSize: scoreBoard.width * .020
    baseRectangleText.anchors.top: scoreBoardColumns.bottom
    baseRectangleText.anchors.topMargin: scoreBoard.height * .01
    baseRectangleText.anchors.leftMargin: scoreBoard.width * .01

    Rectangle {
        height: parent.height * .65
        width: parent.height * 1.1
        anchors.top: scoreBoardColumns.bottom
        anchors.topMargin: scoreBoardColumns.height * .25
        anchors.horizontalCenter: parent.horizontalCenter

        Repeater {
            id: scoreBoardEntries
            model: 10

            Text {
                font.family: "Courier"
                text: (index + 1) + score_board.getPlayerStats((index + 1)) + "\n"
                y: (index + 1) * parent.height * .05

            }
        }
    }
//    rectangleText: "1. " + score_board.getName(1) + score_board.getScore(1) + score_board.getTime(1) + "\n2. " + score_board.getName(2) +
//                   + score_board.getScore(2) + score_board.getTime(2) + " \n3. " + score_board.getName(3) + score_board.getScore(3) + score_board.getTime(3)
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
        anchors.topMargin: scoreBoard.height * .02
    }

    Buttons {
        id:doneButton
        height: scoreBoard.height * .075
        width: scoreBoard.height * .2
        anchors.bottom: scoreBoard.bottom
        anchors.bottomMargin: scoreBoard.height * .01
        anchors.horizontalCenter: scoreBoard.horizontalCenter
        mouseArea.onClicked: {
            scoreBoard.visible = false
            gameOver.visible = true
        }
        buttonText : "Done"
        buttonFont.pointSize: doneButton.height * .3
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
