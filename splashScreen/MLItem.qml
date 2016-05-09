import QtQuick 2.5

Shape {
    secondRight.visible: false
    thirdRight.visible: false
    bottomLeft.visible: false
    bottomRight.visible: false
    shapeColor: "#f06292"
    shapeHeight: topLeft.width * 3
    shapeValue: 4

    rightVirtShift: "up"
    leftHorzShift: "left"
    downHorzShift: "left"
    downVirtShift: "up"

    rrBoardHorzShiftNum: 2
    lrBoardHorzShiftNum: 2
    urBoardHorzShiftNum: 3
    dlboardHorzShiftNum: 1
    drBoardHorzShiftNum: 2

    rlRotateShift: -1
    ulRotateShift: -1
    rrRotateShift: 2

    rotate:(function() {mlitem.rotate();})
}
