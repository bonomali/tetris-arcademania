import QtQuick 2.4

Shape {
    topRight.visible: false
    secondRight.visible: false
    thirdRight.visible: false
    bottomRight.visible: false
    shapeColor: "red"
    shapeWidth: topLeft.width

    focus: true
    Keys.onPressed: {
        if(event.key === Qt.Key_Up)
        {
            line.rotate()
        }
          event.accept = true
    }
}
