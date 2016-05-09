import QtQuick 2.5

Shape {
    bottomLeft.visible: false
    bottomRight.visible: false
    thirdRight.visible: false
    topRight.visible: false
    shapeColor: "#FFBF00"
    shapeHeight: topLeft.width * 3
    shapeValue: 2

    rightVirtShift: "up"
    rightHorzShift: "left"
    leftVirtShift: "down"
    leftHorzShift: "left"
    upVirtShift: "up"
    downVirtShift: "up"
    downHorzShift: "left"

    rrBoardHorzShiftNum: 2
    lrBoardHorzShiftNum: 2
    urBoardHorzShiftNum: 3
    drBoardHorzShiftNum: 2
    dlboardHorzShiftNum: 1

    rlRotateShift: -1
    ulRotateShift: -1
    rrRotateShift: 2

    rotate:(function() {titem.rotate();})
}
