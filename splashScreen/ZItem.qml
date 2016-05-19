
import QtQuick 2.5

Shape {
    id: zItem
    topLeft.visible: false
    thirdRight.visible: false
    bottomLeft.visible: false
    bottomRight.visible: false
    shapeColor: "#ce93d8"
    shapeHeight: topLeft.width * 2
    state: "UPRIGHT"
    shapeValue: 5
    fourStates: false

    rightHorzShift: "left"
    leftHorzShift: "left"
    upVirtShift: "up"
    downVirtShift: "up"

    rrBoardHorzShiftNum: 2
    lrBoardHorzShiftNum: 2
    urBoardHorzShiftNum: 3
    drBoardHorzShiftNum: 3

    rlRotateShift: -1
    lrRotateShift: 2
    ulRotateShift: -1
    rrRotateShift: 2

    virtShiftTop: 0

    rotate:(function() {zitem.rotate();})
    getEndIndex: (function() {return zitem.getEndIndex();})
}
