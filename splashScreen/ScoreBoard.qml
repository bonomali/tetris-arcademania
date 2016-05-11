import QtQuick 2.5

TextRect{
    property alias scoreBoard: scoreBoard.visible
    property int listBullets: 1
    property bool enterName: true
    property int newIndex: 0
    id:scoreBoard
    anchors.centerIn: parent
    height: appWindow.height * .75
    width: appWindow.height * .85
    x: parent.width * .20
    y: parent.height * .40
    visible: false

    function updateScoreBoard(score)
    {
        score_board.writeToFile()
        score_board.readFromFile()
        newIndex = score_board.checkHighScore(score)
        if(newIndex !== -1)
        {
            score_board.setScore(score)
            enterName = true
        }
    }

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
        color: "transparent"
        Repeater {
            id: scoreBoardEntries
            model: 10

            Text {
                text: (index + 1) + ". " + score_board.getName((index + 1)) + "\n"
                x: parent.width * .05
                y: index * (font.pointSize * 1.8)
                font.pointSize: parent.height * .05
                font.family: "Courier"
                color: "#b9d6e1"
            }
        }
    }

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
        buttonText : "Done"
        buttonFont.pointSize: doneButton.height * .3
        visible: !enterName

        mouseArea.onClicked: {
            scoreBoard.visible = false
            gameOver.visible = true
        }
    }

//    Text{
//        id: enterNametxt
//        text: "Enter Name: "
////        anchors.bottom: scoreBoard.bottom
////        anchors.bottomMargin: scoreBoard.height * .15
////        anchors.left: scoreBoard.left
//        font.pointSize: scoreBoard.width * .025
//        color: "#b9d6e1"
//    }

    TextInput
    {
        id: txtin_input
        anchors.bottom: scoreBoard.bottom
        anchors.bottomMargin: scoreBoard.height * .15
        anchors.left: enterNametxt.right
        anchors.leftMargin: enterName.width * .005
        focus: true
        visible: enterName
        cursorVisible: true
        text: "Enter Name: here"
        font.pointSize: scoreBoard.width * .025
        color: "#b9d6e1"
        Keys.onReturnPressed:
        {
            console.log(text)
            score_board.setName(text, newIndex)
            enterName = false
        }
    }

}
