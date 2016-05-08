import QtQuick 2.5

Rectangle {
    id:baseBackground
    property color backColor: _backColorArray[0]
    property color mainColor: _mainColorArray[0]
    property color secColor: _backColorArray[0]
    property color triColor: _secondaryColorArray[0]
    property alias anim1: anim1
    anchors.fill: parent
    color: backColor

    Rectangle{
        id: background1
        color: "transparent"
        height: appWindow.height
        width: appWindow.width

        NumberAnimation on y {
            id: anim1
                loops: Animation.Infinite
                from: 0
                to: appWindow.height;
                duration: 100000
            }
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
    Rectangle{
        id: background2
        color: "transparent"
        height: appWindow.height
        width: appWindow.width

            NumberAnimation on y {
                id: anim2
                loops: Animation.Infinite
                from: -appWindow.height
                to: 0;
                duration: 100000
            }

            Square{
                id: refLeft3
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
                width: refLeft3.width
                height: refLeft3.height
                x: refLeft3.x + refLeft3.width
                y: refLeft3.y + refLeft3.height
            }
            Square{
                color:mainColor
                border.color: secColor
                width: refLeft3.width
                height: refLeft3.height
                x: refLeft3.x - refLeft3.width
                y: refLeft3.y + refLeft3.height * 3
            }

            Square{
                id: refLeft32
                color:mainColor
                border.color: secColor
                width: refLeft3.width
                height: refLeft3.height
                x: refLeft3.x + refLeft3.width
                y: refLeft3.y - refLeft3.height * 4
            }
            Square{
                color:mainColor
                border.color: secColor
                width: refLeft3.width
                height: refLeft3.height
                x: refLeft32.x - refLeft3.width
                y: refLeft32.y
            }
            Square{
                color:mainColor
                border.color: secColor
                width: refLeft3.width
                height: refLeft3.height
                x: refLeft32.x - refLeft3.width
                y: refLeft32.y + refLeft3.width
            }

            Square{
                id: refRight3
                color:mainColor
                border.color: secColor
                width: refLeft3.width
                height: refLeft3.height
                x: refLeft3.x + refLeft3.width * 8
                y: refLeft3.y + refLeft3.height
            }
            Square{
                color:mainColor
                border.color: secColor
                width: refLeft3.width
                height: refLeft3.height
                x: refRight3.x
                y: refRight3.y - refLeft3.height
            }
            Square{
                color:mainColor
                border.color: secColor
                width: refLeft3.width
                height: refLeft3.height
                x: refRight3.x - refLeft3.height
                y: refRight3.y + refLeft3.height
            }

            Square{
                color:mainColor
                border.color: secColor
                width: refLeft3.width
                height: refLeft3.height
                x: refRight3.x
                y: refRight3.y + refLeft3.height * 4
            }

            Square{
                id: refRight32
                color:mainColor
                border.color: secColor
                width: refLeft3.width
                height: refLeft3.height
                x: refRight3.x - refLeft3.height
                y: refRight3.y - refLeft3.height * 4
            }
            Square{
                color:mainColor
                border.color: secColor
                width: refLeft3.width
                height: refLeft3.height
                x: refRight32.x + refLeft3.height
                y: refRight32.y
            }
    }
    Rectangle{
        id: background3
        color: "transparent"
        height: appWindow.height
        width: appWindow.width

            NumberAnimation on y {
                id: anim3
                loops: Animation.Infinite
                from: -appWindow.height
                to: appWindow.height;
                duration: 150000
            }

            Square{
                id: refLeft4
                color:triColor
                border.color: secColor
                width: appWindow.width * .1
                height: appWindow.width * .1
                x: appWindow.width * .05
                y: appWindow.height * .4
            }
            Square{
                color:triColor
                border.color: secColor
                width: refLeft4.width
                height: refLeft4.height
                x: refLeft4.x + refLeft4.width
                y: refLeft4.y + refLeft4.height
            }
            Square{
                color:triColor
                border.color: secColor
                width: refLeft4.width
                height: refLeft4.height
                x: refLeft4.x - refLeft4.width
                y: refLeft4.y + refLeft4.height * 3
            }

            Square{
                id: refLeft42
                color:triColor
                border.color: secColor
                width: refLeft4.width
                height: refLeft4.height
                x: refLeft4.x + refLeft4.width
                y: refLeft4.y - refLeft4.height * 4
            }
            Square{
                color:triColor
                border.color: secColor
                width: refLeft4.width
                height: refLeft4.height
                x: refLeft42.x - refLeft4.width
                y: refLeft42.y
            }
            Square{
                color:triColor
                border.color: secColor
                width: refLeft4.width
                height: refLeft4.height
                x: refLeft42.x - refLeft4.width
                y: refLeft42.y + refLeft4.width
            }

            Square{
                id: refRight4
                color:triColor
                border.color: secColor
                width: refLeft4.width
                height: refLeft4.height
                x: refLeft4.x + refLeft4.width * 8
                y: refLeft4.y + refLeft4.height
            }
            Square{
                color:triColor
                border.color: secColor
                width: refLeft4.width
                height: refLeft4.height
                x: refRight4.x
                y: refRight4.y - refLeft4.height
            }
            Square{
                color:triColor
                border.color: secColor
                width: refLeft4.width
                height: refLeft4.height
                x: refRight4.x - refLeft4.height
                y: refRight4.y + refLeft4.height
            }

            Square{
                color:triColor
                border.color: secColor
                width: refLeft4.width
                height: refLeft4.height
                x: refRight4.x
                y: refRight4.y + refLeft4.height * 4
            }

            Square{
                id: refRight42
                color:triColor
                border.color: secColor
                width: refLeft4.width
                height: refLeft4.height
                x: refRight4.x - refLeft4.height
                y: refRight4.y - refLeft4.height * 4
            }
            Square{
                color:triColor
                border.color: secColor
                width: refLeft4.width
                height: refLeft4.height
                x: refRight42.x + refLeft4.height
                y: refRight42.y
            }

}
}
