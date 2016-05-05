import QtQuick 2.5

Rectangle {
    property color mainColor: "#002355"
    property color secColor: "#001c44"
    anchors.fill: parent

    color: "#001c44"

    Square{
        id: refLeft
        color:mainColor
        border.color: secColor
        width: appWindow.width * .1
        height: appWindow.width * .1
        x: appWindow.width * .05
        y: appWindow.height * .4
    }
    Square{
        color:mainColor
        border.color: secColor
        width: refLeft.width
        height: refLeft.height
        x: refLeft.x + refLeft.width
        y: refLeft.y + refLeft.height
    }
    Square{
        color:mainColor
        border.color: secColor
        width: refLeft.width
        height: refLeft.height
        x: refLeft.x - refLeft.width
        y: refLeft.y + refLeft.height * 3
    }

    Square{
        id: refLeft2
        color:mainColor
        border.color: secColor
        width: refLeft.width
        height: refLeft.height
        x: refLeft.x + refLeft.width
        y: refLeft.y - refLeft.height * 4
    }
    Square{
        color:mainColor
        border.color: secColor
        width: refLeft.width
        height: refLeft.height
        x: refLeft2.x - refLeft.width
        y: refLeft2.y
    }
    Square{
        color:mainColor
        border.color: secColor
        width: refLeft.width
        height: refLeft.height
        x: refLeft2.x - refLeft.width
        y: refLeft2.y + refLeft.width
    }

    Square{
        id: refRight
        color:mainColor
        border.color: secColor
        width: refLeft.width
        height: refLeft.height
        x: refLeft.x + refLeft.width * 8
        y: refLeft.y + refLeft.height
    }
    Square{
        color:mainColor
        border.color: secColor
        width: refLeft.width
        height: refLeft.height
        x: refRight.x
        y: refRight.y - refLeft.height
    }
    Square{
        color:mainColor
        border.color: secColor
        width: refLeft.width
        height: refLeft.height
        x: refRight.x - refLeft.height
        y: refRight.y + refLeft.height
    }

    Square{
        color:mainColor
        border.color: secColor
        width: refLeft.width
        height: refLeft.height
        x: refRight.x
        y: refRight.y + refLeft.height * 4
    }

    Square{
        id: refRight2
        color:mainColor
        border.color: secColor
        width: refLeft.width
        height: refLeft.height
        x: refRight.x - refLeft.height
        y: refRight.y - refLeft.height * 4
    }
    Square{
        color:mainColor
        border.color: secColor
        width: refLeft.width
        height: refLeft.height
        x: refRight2.x + refLeft.height
        y: refRight2.y
    }
}
