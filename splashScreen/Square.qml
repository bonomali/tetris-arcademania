import QtQuick 2.4

Rectangle {
    property alias baseSquare: baseSquare
    id: baseSquare
    width: Math.floor(appWindow.height * .029)
    height: appWindow.height * .029
    radius: appWindow.height * .005
}
