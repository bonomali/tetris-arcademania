TEMPLATE = app

QT += qml quick widgets
QT += multimedia
CONFIG += c++11

SOURCES += main.cpp \
    maingrid.cpp \
    ishapes.cpp \
    cubeitem.cpp \
    litem.cpp \
    mlitem.cpp \
    mzitem.cpp \
    titem.cpp \
    zitem.cpp \
    lineitem.cpp

RESOURCES += qml.qrc \
    sound.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    ComponentGenerator.js

HEADERS += \
    maingrid.h \
    ishapes.h \
    cubeitem.h \
    litem.h \
    mlitem.h \
    mzitem.h \
    titem.h \
    zitem.h \
    lineitem.h
