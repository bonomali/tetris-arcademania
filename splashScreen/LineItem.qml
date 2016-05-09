import QtQuick 2.5

Shape {
    topRight.visible: false
    secondRight.visible: false
    thirdRight.visible: false
    bottomRight.visible: false
    shapeColor: "#ff0000"
    shapeHeight: topLeft.width * 3
    shapeValue: 1

    rightHorzShift: "left"
    leftHorzShift: "left"
    upVirtShift: "up"
    upHorzShift: "left"
    downVirtShift: "up"
    downHorzShift: "left"
    rrBoardHorzShiftNum: 1
    lrBoardHorzShiftNum: 1
    ulBoardHorzShiftNum: 1
    urBoardHorzShiftNum: 3
    dlboardHorzShiftNum: 1
    drBoardHorzShiftNum: 3

    rightBoardVirtShiftNum: 2
    leftBoardVirtShiftNum: 2
    upBoardVirtShiftNum: 2
    downBoardVirtShiftNum: 2

    lrRotateShift: 2
    rrRotateShift: 2

    fourStates: false
    rotate:(function() {line.rotate();})
}
