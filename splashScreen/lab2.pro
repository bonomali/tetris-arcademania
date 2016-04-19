TEMPLATE = app

QT += qml quick widgets
QT += multimedia
CONFIG += c++11

SOURCES += main.cpp \
    maingrid.cpp \
    cubeitem.cpp \

RESOURCES += qml.qrc \
    sound.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES +=

HEADERS += \
    maingrid.h \
    cubeitem.h \
