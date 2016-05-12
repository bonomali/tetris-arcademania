import QtQuick 2.5

TextRect{
    property alias scoreBoard: scoreBoard.visible
    property int i: 1
    property bool enterName: false
    property int newIndex: 0
    id:scoreBoard

    anchors.centerIn: parent
    height: appWindow.height * .75
    width: appWindow.height * .85
    x: parent.width * .20
    y: parent.height * .40
    visible: false

    function updateScoreBoard()
    {
        score_board.writeToFile()
        score_board.readFromFile()
        newIndex = score_board.checkHighScore(_score, gamePlayTimer)
        if(newIndex !== -1)
        {
            enterName = true
            txtin_input.focus = true
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
                x: parent.width * .05
                y: index * (font.pointSize * 1.8)
                font.pointSize: parent.height * .05
                color: "#b9d6e1"
                font.family: "Courier"
                text: (index + 1) + ". " + score_board.getPlayerStats((index + 1)) + "\n"
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
        height: scoreBoard.height * .125
        width: scoreBoard.height * .3
        anchors.bottom: scoreBoard.bottom
        anchors.bottomMargin: scoreBoard.height * .025
        anchors.horizontalCenter: scoreBoard.horizontalCenter
        buttonText : "Done"
        buttonFont.pointSize: doneButton.height * .3
        visible: !enterName

        mouseArea.onClicked: {
            scoreBoard.visible = false
        }
    }

    Rectangle{
        height: scoreBoard.height * .1
        width: scoreBoard.width * .8
        radius: 15
        visible: enterName
        color: "#014880"
        anchors.bottom: scoreBoard.bottom
        anchors.bottomMargin: scoreBoard.height * .05
        anchors.left: scoreBoard.left
        anchors.leftMargin: scoreBoard.width * .1

        TextInput
        {
            id: txtin_input
            focus: true
            cursorVisible: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: parent.width * .35
            text: ""
            font.pointSize: scoreBoard.width * .025
            color: "#b9d6e1"
            Keys.onReturnPressed:
            {
                console.log(text)
                score_board.setName(text, newIndex)
                enterName = false

                for( i = 0; i < 9; i++)         //No sure if this works yet to correctly space the tenth spot, may need to change
                    scoreBoardEntries.itemAt(i).text = " " + (i + 1) + ". " + score_board.getPlayerStats((i + 1)) + "\n"

                (i + 1) + ". " + score_board.getPlayerStats((i + 1)) + "\n"
            }
        }

        Text{
            id: enterNametxt
            text: "Enter Name: "
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: parent.width * .05
            font.pointSize: scoreBoard.width * .025
            color: "#b9d6e1"
        }
    }
}
