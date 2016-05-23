import QtQuick 2.5
import QtQuick.Controls 1.3
import QtMultimedia 5.6

Rectangle{
    id: splashScreen
    width: appWindow.width
    height: appWindow.height

    property bool isButtonEnabled: false
    property bool homebuttonPressed: false

    Keys.onPressed: {
        if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter)
        {
            console.log("enter pressed")
            defButtonSound.play()
            currentLevel = _levelSelected
            splashScreen.visible = false
            appWindow.initializeBoard1.initializeBoard()
            parent.focus = false
        }
        else if (event.key === Qt.Key_Right && _levelSelected < 10)
        {
            _levelSelected++
            levelSelectSFX.play()
        }
        else if (event.key === Qt.Key_Left && _levelSelected > 1)
        {
            _levelSelected--
            levelSelectSFX.play()
        }

}
    onFocusChanged: isButtonEnabled = true

    Audio {
        id: defButtonSound
        source: "Scary impact.wav"
        autoLoad: true
    }
    Audio {
        id: levelSelectSFX
        source: "Fast zing.wav"
        autoLoad: true
    }

    Image{
        source: "background.jpg"
        anchors.fill: parent
    }
    Buttons {
        id:startButton
        visible: !homebuttonPressed
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * .10
        anchors.horizontalCenter: parent.horizontalCenter
        enabled: isButtonEnabled
        mouseArea.onClicked: {
            defButtonSound.play()
            currentLevel = _levelSelected
            parent.visible = false
            appWindow.initializeBoard1.initializeBoard()
            parent.focus = false
        }
        buttonText : "NewGame"
    }

    Buttons {
        id:newGame
        visible: homebuttonPressed
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * .10
        anchors.left: parent.left
        anchors.leftMargin: parent.width * .1
        enabled: isButtonEnabled
        mouseArea.onClicked: {
            defButtonSound.play()
            currentLevel = _levelSelected
            parent.visible = false
            appWindow.initializeBoard1.initializeBoard()
            parent.focus = false
            xCoord = 6
        }
        buttonText : "newGame"
    }
    Buttons {
        id:contButton
        visible: homebuttonPressed
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * .10
        anchors.right: parent.right
        anchors.rightMargin: parent.width * .1
        enabled: isButtonEnabled
        mouseArea.onClicked: {
            switch(fallingShape)
              {
              case 0:
                  appWindow.initializeBoard1.sCube.focus = true;
                  appWindow.initializeBoard1.sCube.sleep.running = true;
                  break;
              case 1:
                  appWindow.initializeBoard1.sLineItem.focus = true;
                  appWindow.initializeBoard1.sLineItem.sleep.running = true;
                  break;
              case 2:
                  appWindow.initializeBoard1.sLItem.focus = true;
                  appWindow.initializeBoard1.sLItem.sleep.running = true;
                  break;
              case 3:
                  appWindow.initializeBoard1.sMLItem.focus = true;
                  appWindow.initializeBoard1.sMLItem.sleep.running = true;
                  break;
              case 4:
                  appWindow.initializeBoard1.sMZItem.focus = true;
                  appWindow.initializeBoard1.sMZItem.sleep.running = true;
                  break;
              case 5:
                  appWindow.initializeBoard1.sTItem.focus = true;
                  appWindow.initializeBoard1.sTItem.sleep.running = true;
                  break;
              case 6:
                  appWindow.initializeBoard1.sZItem.focus = true;
                  appWindow.initializeBoard1.sZItem.sleep.running = true;
                  break;
              default:
                  throw("Invalid RNG value");
              }


            parent.visible = false
            parent.focus = false
        }
        buttonText : "Continue"
    }

    Text{
        text:"Level Select"
        color: "#AAFFFFFF"
        font.pointSize: 15
        font.bold: true
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: parent.height * .45
    }

    Buttons {
        id:leftButton
        width: parent.width * .10; height: parent.height * .10
        anchors.bottom: startButton.top
        anchors.bottomMargin: startButton.height * .50
        anchors.horizontalCenter: startButton.horizontalCenter
        anchors.horizontalCenterOffset: startButton.width * -.35
        enabled: isButtonEnabled
        mouseArea.onClicked: {
            if (_levelSelected > 1)
            {
                _levelSelected--
                levelSelectSFX.play()
            }
        }
        buttonText : "<-"
        }

    Buttons {
        id:rightButton
        width: parent.width * .10; height: parent.height * .10
        anchors.bottom: startButton.top
        anchors.bottomMargin: startButton.height * .50
        anchors.horizontalCenter: startButton.horizontalCenter
        anchors.horizontalCenterOffset: startButton.width * .35
        enabled: isButtonEnabled
        mouseArea.onClicked: {
            if (_levelSelected < 10)
            {
                _levelSelected++
                levelSelectSFX.play()
            }
        }
        buttonText : "->"
    }

    TextRect{
        id:textRect
        height: parent.height * .10
        width: parent.width * .10
        anchors.bottom: startButton.top
        anchors.bottomMargin: startButton.height * .5
        anchors.horizontalCenter: startButton.horizontalCenter
        rectangleFont.pointSize: 15
        baseRectangleText.anchors.centerIn: textRect
        rectangleText: _levelSelected
    }

    Image{
        source: "icon.jpg"
        anchors.top: parent.top
        anchors.topMargin: parent.height * .10
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height * .35
        width: parent.width * .90
    }

    Dialog{
        id:ourNames
        height: parent.height * .2
        width: parent.width * .57
        x: parent.width * .20
        y: parent.height * .40
        rectangleFont.pointSize: ourNames.height * .07
        baseRectangleText.anchors.centerIn: ourNames
        diagButtonFont.pointSize: ourNames.height * .07
        rectangleText: "Hello from Isaac and Stephanie!"
        diagButtonText: "Goodbye"
        visible: false
    }

    Dialog{
        id:startMessage
        width: appWindow.width * .8
        height: appWindow.height * .85
        baseRectangleText.width: startMessage.width * .90
        baseRectangleText.height: startMessage.height * .85
        baseRectangleText.anchors.centerIn: startMessage

        rectangleFont.pointSize: startMessage.height * .020
        rectangleText: "Our project is the game Tetris. The user will use the arrow keys to move falling shapes. The goal of the game is to align the shapes so they create complete horizontal lines along the game play area. When a complete horizontal line is created, it will disappear. Other features will include a game score, a preview of the next shape to fall, a counter for the number of complete lines created, the level of game play, and a speed up feature that will increase the rate at which the shapes fall as the user moves up a game play level."
        diagButtonText: "Okay"
        x: parent.width / 11
        y: parent.height / 11
        visible: false
    }
}




