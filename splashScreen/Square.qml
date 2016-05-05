import QtQuick 2.5

Rectangle {
    property alias baseSquare: baseSquare
    id: baseSquare
    width: Math.floor(appWindow.height * .029)
    height: Math.floor(appWindow.height * .029)
    radius: appWindow.height * .005
}
