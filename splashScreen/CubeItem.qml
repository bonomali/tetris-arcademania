import QtQuick 2.5

Shape {
    bottomLeft.visible: false
    bottomRight.visible: false
    thirdLeft.visible: false
    thirdRight.visible: false
    shapeHeight: refSquare.width * 2
    shapeColor: "yellow"
    shapeValue: 0
    rotateShape: false

    ulBoardHorzShiftNum: -1
    urBoardHorzShiftNum: 3

    rotate:(function() {cube.rotate();})
    getEndIndex: (function() {return cube.getEndIndex();})
}
