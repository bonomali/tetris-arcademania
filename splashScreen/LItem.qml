import QtQuick 2.5
Shape {
    topRight.visible: false
    secondRight.visible: false
    bottomLeft.visible: false
    bottomRight.visible: false
    shapeColor: "orange"
    shapeHeight: refSquare.width * 3
    shapeValue: 3

    rightVirtShift: "up"
    leftHorzShift: "left"
    downHorzShift: "left"

    rrBoardHorzShiftNum: 2
    lrBoardHorzShiftNum: 2
    urBoardHorzShiftNum: 3
    drBoardHorzShiftNum: 2
    dlboardHorzShiftNum: 1

    rlRotateShift: -1
    ulRotateShift: -1
    rrRotateShift: 2

    rotate:(function() {litem.rotate();})
    getEndIndex: (function() {return litem.getEndIndex();})
}
