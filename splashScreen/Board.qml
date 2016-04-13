import QtQuick 2.4
import QTGraphicalEffects 1.0

Rectangle{
    property alias playArea:playArea
    property int index: 0

    id: playAreaBoarder
    color: "black"
    border.color: "#002355"
    border.width: 3
    height: playArea.height * 1.03
    width: playArea.width * 1.05
    anchors.bottom: parent.bottom
    anchors.bottomMargin: parent.height * .0025
    anchors.horizontalCenter: parent.horizontalCenter

    Rectangle {
        id: playArea
        //anchors.bottom: parent.bottom
        anchors.horizontalCenter: playAreaBoarder.horizontalCenter
        anchors.verticalCenter: playAreaBoarder.verticalCenter
        height: referenceSquare.height * 32
        width: referenceSquare.width * 16

        RadialGradient{
            anchors.fill: playArea
            gradient: Gradient{
                GradientStop{ position: 0.0; color: "#002355"}
                GradientStop{ position: 0.5; color: "#03142b"}
            }
        }

        Square{
            id:referenceSquare
            color:"transparent"
            border.color: "grey"
        }

        LineItem {
        }

        Canvas {
            id: root
            // canvas size
            width: playArea.width; height: playArea.height
            // handler to override for drawing
            onPaint: {
                // get context to draw with
                var ctx = getContext("2d")
                // setup the stroke
                ctx.strokeStyle = "Black"

                //create vertical grid lines
                for(index = 1; index <= 16; index++)
                {
                    ctx.beginPath()
                    // top start point
                    ctx.moveTo(playArea.width / 16 * index,0)
                    // bottom end point
                    ctx.lineTo(playArea.width / 16 * index,playArea.height)
                    // stop at end point
                    ctx.closePath()
                    // paint line
                    ctx.stroke()
                }
                for(index = 1; index <= 32; index++)
                {
                    ctx.beginPath()
                    // top start point
                    ctx.moveTo(0, playArea.height / 32 * index)
                    // bottom end point
                    ctx.lineTo(playArea.width, playArea.height / 32 * index)
                    // stop at end point
                    ctx.closePath()
                    // paint line
                    ctx.stroke()
                }
            }
        }
    }

}
