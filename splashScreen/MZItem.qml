import QtQuick 2.5

Shape {
    id:mZItem
    topRight.visible: false
    bottomRight.visible: false
    thirdLeft.visible: false
    bottomLeft.visible: false
    shapeColor: "#7FFFD4"
    shapeHeight: refSquare.width * 2
    state: "UPRIGHT"
    shapeValue: 6
    rotation: 90
    fourStates: false

    rightHorzShift: "left"
    leftHorzShift: "left"
    upVirtShift: "up"
    downVirtShift: "up"

    rrBoardHorzShiftNum: 2
    lrBoardHorzShiftNum: 2
    urBoardHorzShiftNum: 3
    drBoardHorzShiftNum: 2

    rlRotateShift: -1
    ulRotateShift: -1
    rrRotateShift: 2

    virtShiftTop: 0

    rotate:(function() {mzitem.rotate();})
    getEndIndex: (function() {return mzitem.getEndIndex();})
}
