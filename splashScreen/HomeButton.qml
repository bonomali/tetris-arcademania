import QtQuick 2.5

Item {
    id: homeButton
    anchors.fill: parent
    property bool hovered: false

    Image{
        id: homeIcon
        source: "home.png"
        anchors.right: parent.right
        anchors.rightMargin: parent.width * .1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.width * .025
        width: parent.height * 0.05
        height: parent.height * 0.05
    }
    Image{
        id: homeIconPressed
        source: "homePressed.png"
        visible: hovered
        anchors.right: parent.right
        anchors.rightMargin: parent.width * .1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.width * .025
        width: parent.height * 0.05
        height: parent.height * 0.05
    }

    MouseArea{
        anchors.fill: homeIcon
        hoverEnabled: true
        onEntered: hovered = true
        onExited: hovered = false
        onPressed: {
            splashScreen.visible = true
            splashScreen.focus = true
            splashScreen.homebuttonPressed = true

            switch(fallingShape)
              {
              case 0:
                  appWindow.initializeBoard1.sCube.focus = false;
                  appWindow.initializeBoard1.sCube.sleep.running = false;
                  break;
              case 1:
                  appWindow.initializeBoard1.sLineItem.focus = false;
                  appWindow.initializeBoard1.sLineItem.sleep.running = false;
                  break;
              case 2:
                  appWindow.initializeBoard1.sLItem.focus = false;
                  appWindow.initializeBoard1.sLItem.sleep.running = false;
                  break;
              case 3:
                  appWindow.initializeBoard1.sMLItem.focus = false;
                  appWindow.initializeBoard1.sMLItem.sleep.running = false;
                  break;
              case 4:
                  appWindow.initializeBoard1.sMZItem.focus = false;
                  appWindow.initializeBoard1.sMZItem.sleep.running = false;
                  break;
              case 5:
                  appWindow.initializeBoard1.sTItem.focus = false;
                  appWindow.initializeBoard1.sTItem.sleep.running = false;
                  break;
              case 6:
                  appWindow.initializeBoard1.sZItem.focus = false;
                  appWindow.initializeBoard1.sZItem.sleep.running = false;
                  break;
              default:
                  throw("Invalid Shape value");
              }
        }
    }
}
