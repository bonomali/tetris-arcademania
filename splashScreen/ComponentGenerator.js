var component;
var sprite;
function createSpriteObjects() {
    component = Qt.createComponent("Shape.qml");
    if (component.status === Component.Ready)
            createComponent("Shape.qml");
    else
        component.statusChanged.connect(finishCreation);
}
