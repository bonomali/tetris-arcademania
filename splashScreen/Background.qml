import QtQuick 2.5

/*************************************************************************************************
* Purpose: Display an animated background during gameplay
**************************************************************************************************/
Rectangle {
    id:baseBackground
    property color backColor: _backColorArray[0]        //background color
    property color mainColor: _mainColorArray[0]        //Color of forefront cubes
    property color secColor: _secondaryColorArray[0]    //Color of background cubes
    property color boarderColor: _backColorArray[0]     //Boarder color of cubes
    property alias backCubeAnim: backCubeAnim           //Public reference to the background cube animation
    anchors.fill: parent
    color: backColor                                    //sets background color based on the current
                                                        //_backColorArray index

    // Encapsulates a collection of cubes
    Rectangle{
        id: cubesLayer1
        color: "transparent"
        height: appWindow.height
        width: appWindow.width

        // Animates the collection of cubes downwards
        NumberAnimation on y {
            id: backCubeAnim
                loops: Animation.Infinite
                from: 0
                to: appWindow.height;
                duration: 100000
            }
            Square{
                id: refSquare
                color:_mainColorArray[_level - 1]
                border.color: refSquare3.border.color
                width: appWindow.width * .1
                height: appWindow.width * .1
                x: appWindow.width * .05
                y: appWindow.height * .4

                //Animates the color shift after a level change
                ColorAnimation on color {
                    id: cubeColorAnim
                    to: _mainColorArray[_level] //sets transition color
                    duration: 5000
                    running: animate        //after animation stops, set running to false
                }
            }
            Square{
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare.width
                height: refSquare.height
                x: refSquare.x + refSquare.width
                y: refSquare.y + refSquare.height
            }

            Square{
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare.width
                height: refSquare.height
                x: refSquare.x - refSquare.width
                y: refSquare.y + refSquare.height * 3
            }

            Square{
                id: refLeft2
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare.width
                height: refSquare.height
                x: refSquare.x + refSquare.width
                y: refSquare.y - refSquare.height * 4
            }
            Square{
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare.width
                height: refSquare.height
                x: refLeft2.x - refSquare.width
                y: refLeft2.y
            }
            Square{
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare.width
                height: refSquare.height
                x: refLeft2.x - refSquare.width
                y: refLeft2.y + refSquare.width
            }

            Square{
                id: refRight
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare.width
                height: refSquare.height
                x: refSquare.x + refSquare.width * 8
                y: refSquare.y + refSquare.height
            }
            Square{
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare.width
                height: refSquare.height
                x: refRight.x
                y: refRight.y - refSquare.height
            }
            Square{
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare.width
                height: refSquare.height
                x: refRight.x - refSquare.height
                y: refRight.y + refSquare.height
            }

            Square{
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare.width
                height: refSquare.height
                x: refRight.x
                y: refRight.y + refSquare.height * 4
            }

            Square{
                id: refRight2
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare.width
                height: refSquare.height
                x: refRight.x - refSquare.height
                y: refRight.y - refSquare.height * 4
            }
            Square{
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare.width
                height: refSquare.height
                x: refRight2.x + refSquare.height
                y: refRight2.y
            }
    }

    // Encapsulates a second collection of cubes
    Rectangle{
        id: cubesLayer2
        color: "transparent"
        height: appWindow.height
        width: appWindow.width

            // Animates the collection of cubes downwards
            NumberAnimation on y {
                loops: Animation.Infinite
                from: -appWindow.height
                to: 0;
                duration: 100000
            }

            Square{
                id: refSquare2
                color:refSquare.color
                border.color: refSquare3.border.color
                width: appWindow.width * .1
                height: appWindow.width * .1
                x: appWindow.width * .05
                y: appWindow.height * .4
            }
            Square{
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare2.width
                height: refSquare2.height
                x: refSquare2.x + refSquare2.width
                y: refSquare2.y + refSquare2.height
            }
            Square{
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare2.width
                height: refSquare2.height
                x: refSquare2.x - refSquare2.width
                y: refSquare2.y + refSquare2.height * 3
            }

            Square{
                id: refSquare22
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare2.width
                height: refSquare2.height
                x: refSquare2.x + refSquare2.width
                y: refSquare2.y - refSquare2.height * 4
            }
            Square{
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare2.width
                height: refSquare2.height
                x: refSquare22.x - refSquare2.width
                y: refSquare22.y
            }
            Square{
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare2.width
                height: refSquare2.height
                x: refSquare22.x - refSquare2.width
                y: refSquare22.y + refSquare2.width
            }

            Square{
                id: refRight3
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare2.width
                height: refSquare2.height
                x: refSquare2.x + refSquare2.width * 8
                y: refSquare2.y + refSquare2.height
            }
            Square{
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare2.width
                height: refSquare2.height
                x: refRight3.x
                y: refRight3.y - refSquare2.height
            }
            Square{
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare2.width
                height: refSquare2.height
                x: refRight3.x - refSquare2.height
                y: refRight3.y + refSquare2.height
            }

            Square{
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare2.width
                height: refSquare2.height
                x: refRight3.x
                y: refRight3.y + refSquare2.height * 4
            }

            Square{
                id: refSquare4
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare2.width
                height: refSquare2.height
                x: refRight3.x - refSquare2.height
                y: refRight3.y - refSquare2.height * 4
            }
            Square{
                color:refSquare.color
                border.color: refSquare3.border.color
                width: refSquare2.width
                height: refSquare2.height
                x: refSquare4.x + refSquare2.height
                y: refSquare4.y
            }
    }

    // Encapsulates a third collection of cubes
    Rectangle{
        id: cubesLayer3
        color: "transparent"
        height: appWindow.height
        width: appWindow.width

            // Animates the collection of cubes downwards
            NumberAnimation on y {
                loops: Animation.Infinite
                from: -appWindow.height
                to: appWindow.height;
                duration: 150000
            }

            Square{
                id: refSquare3
                color:secColor
                border.color: backColor
                width: appWindow.width * .1
                height: appWindow.width * .1
                x: appWindow.width * .05
                y: appWindow.height * .4
                ColorAnimation on color {
                    id: squareColorAnim
                    to: _secondaryColorArray[_level]
                    duration: 5000
                    running: animate
                }
                ColorAnimation on border.color {
                    id: squareColorBoardAnim
                    to: _backColorArray[_level]
                    duration: 5000
                    running: animate
                }

            }
            Square{
                color:refSquare3.color
                border.color: refSquare3.border.color
                width: refSquare3.width
                height: refSquare3.height
                x: refSquare3.x + refSquare3.width
                y: refSquare3.y + refSquare3.height
            }
            Square{
                color:refSquare3.color
                border.color: refSquare3.border.color
                width: refSquare3.width
                height: refSquare3.height
                x: refSquare3.x - refSquare3.width
                y: refSquare3.y + refSquare3.height * 3
            }

            Square{
                id: refSquare5
                color:refSquare3.color
                border.color: refSquare3.border.color
                width: refSquare3.width
                height: refSquare3.height
                x: refSquare3.x + refSquare3.width
                y: refSquare3.y - refSquare3.height * 4
            }
            Square{
                color:refSquare3.color
                border.color: refSquare3.border.color
                width: refSquare3.width
                height: refSquare3.height
                x: refSquare5.x - refSquare3.width
                y: refSquare5.y
            }
            Square{
                color:refSquare3.color
                border.color: refSquare3.border.color
                width: refSquare3.width
                height: refSquare3.height
                x: refSquare5.x - refSquare3.width
                y: refSquare5.y + refSquare3.width
            }

            Square{
                id: refRight4
                color:refSquare3.color
                border.color: refSquare3.border.color
                width: refSquare3.width
                height: refSquare3.height
                x: refSquare3.x + refSquare3.width * 8
                y: refSquare3.y + refSquare3.height
            }
            Square{
                color:refSquare3.color
                border.color: refSquare3.border.color
                width: refSquare3.width
                height: refSquare3.height
                x: refRight4.x
                y: refRight4.y - refSquare3.height
            }
            Square{
                color:refSquare3.color
                border.color: refSquare3.border.color
                width: refSquare3.width
                height: refSquare3.height
                x: refRight4.x - refSquare3.height
                y: refRight4.y + refSquare3.height
            }

            Square{
                color:refSquare3.color
                border.color: refSquare3.border.color
                width: refSquare3.width
                height: refSquare3.height
                x: refRight4.x
                y: refRight4.y + refSquare3.height * 4
            }

            Square{
                id: refRight42
                color:refSquare3.color
                border.color: refSquare3.border.color
                width: refSquare3.width
                height: refSquare3.height
                x: refRight4.x - refSquare3.height
                y: refRight4.y - refSquare3.height * 4
            }
            Square{
                color:refSquare3.color
                border.color: refSquare3.border.color
                width: refSquare3.width
                height: refSquare3.height
                x: refRight42.x + refSquare3.height
                y: refRight42.y
            }
    }
}
