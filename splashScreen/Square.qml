import QtQuick 2.4

Rectangle {
    property alias baseSquare: baseSquare
    id: baseSquare
    width: appWindow.height * .03
    height: appWindow.height * .03
    radius: appWindow.height * .005
}
