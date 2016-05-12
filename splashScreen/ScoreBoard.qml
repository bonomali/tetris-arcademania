import QtQuick 2.5
import QtQuick.Controls 1.4

TextRect{
    id:scoreBoard
    property alias scoreBoard: scoreBoard.visible
    property int i: 1
    property bool enterName: false
    property int newIndex: 0
    property string allScores: ""
    rectangleFont.pointSize: scoreBoard.width * .020
    baseRectangleText.anchors.top: scoreBoardColumns.bottom
    baseRectangleText.anchors.topMargin: scoreBoard.height * .01
    baseRectangleText.anchors.leftMargin: scoreBoard.width * .01
    radius: appWindow.height * .05
    anchors.centerIn: parent
    height: appWindow.height * .75
    width: appWindow.height * .85
    x: parent.width * .20
    y: parent.height * .40
    visible: false
    color: "#EE0060a9"

    Component.onCompleted: {

        refreshScoreBoard()
        if (!enterName)
        {
            txtin_input.focus = false
            scoreBoard.focus = true
        }
    }

    Keys.onPressed: {
        if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter)
        {
            scoreBoard.visible = false
            splashScreen.focus = true
            anim1.complete()
            anim2.complete()
        }
    }
    function refreshScoreBoard()
    {
        allScores = ""

        for(i = 1; i <= 15; i++)
        {
            if(i < 10)
                allScores += " " + i + ". " + score_board.getPlayerStats(i) + "\n"
            else
                allScores += i + ". " + score_board.getPlayerStats(i) + "\n"
        }
    }

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
        return enterName
    }

    Rectangle {
        id: listOfNames
        height: parent.height * .61
        width: parent.height * 1.1
        anchors.top: scoreBoardColumns.bottom
        anchors.topMargin: scoreBoardColumns.height * .25
        anchors.horizontalCenter: parent.horizontalCenter
        color: "transparent"
        clip: true

        Rectangle {
            id:scrollin
            x: parent.x * 6
            width: parent.width
            height: parent.height
            color: "transparent"
            Text{
                text: allScores
                font.pointSize: parent.height * .05
                color: "#b9d6e1"
                font.family: "Courier"
            }

            SequentialAnimation on y{
                id: anim1
                running: !enterName
                PauseAnimation {duration: 2000}
                NumberAnimation{
                    id: initialAnim
                    from: 0
                    to: -scrollin.height * 1.5
                    duration: 25000
                    loops: Animation.Infinite
                }
            }
        }

        Rectangle {
            id:scrollin2
            width: parent.width
            height: parent.height
            x: parent.x * 6
            color: "transparent"
            Text{
                text: allScores
                font.pointSize: parent.height * .05
                color: "#b9d6e1"
                font.family: "Courier"
            }

            SequentialAnimation on y{
                id:anim2
                running: !enterName
                PauseAnimation {duration: 2000}
                NumberAnimation{
                    id: initialAnim2
                    from: scrollin2.height * 1.5
                    to: 0
                    duration: 25000
                    loops: Animation.Infinite
                }
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
        font.family: "Courier"
        text: "     Name\t\t Score\tTime"
        anchors.top: scoreBoardHeader.bottom
        x: listOfNames.width * .05
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
            splashScreen.focus = true
            anim1.complete()
            anim2.complete()
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
            focus: enterName
            cursorVisible: enterName
            anchors.centerIn: parent
            text: "Enter Name Here"
            MouseArea{
                anchors.fill: parent
                onClicked: txtin_input.text = ""
            }

            font.pointSize: scoreBoard.width * .025
            color: "#CCb9d6e1"
            Keys.onPressed: {
                if (txtin_input.text === "Enter Name Here")
                    txtin_input.text = ""
            }

            Keys.onReturnPressed:
            {
                score_board.setName(text, newIndex)
                enterName = false
                scoreBoard.focus = true
                refreshScoreBoard()
                gameOver.visible = true
                gameOver.focus = true
            }
        }
    }
}
