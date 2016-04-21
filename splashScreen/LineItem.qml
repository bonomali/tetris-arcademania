import QtQuick 2.4

Shape {
    id:lineItem
    topRight.visible: false
    secondRight.visible: false
    thirdRight.visible: false
    bottomRight.visible: false
    shapeColor: "red"
    shapeWidth: topLeft.width

//    states: State
//    {
//        name: "rotated"

//        PropertyChanges {
//            target: lineItem; rotation: 90; origin.x:  }
//    }
    focus: true
    Keys.onPressed: {
        if(event.key === Qt.Key_Up)
        {


            line.rotate()
        }
          event.accept = true
    }
}
