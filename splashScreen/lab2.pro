TEMPLATE = app

QT += qml quick widgets
QT += multimedia
CONFIG += c++11

SOURCES += main.cpp \
    maingrid.cpp \
    cubeitem.cpp \
    ishapes.cpp \
    lineitem.cpp \
    titem.cpp \
    zitem.cpp \
    mzitem.cpp \
    litem.cpp \
    mlitem.cpp

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
    ishapes.h \
    lineitem.h \
    titem.h \
    zitem.h \
    mzitem.h \
    litem.h \
    mlitem.h \
    array.h \
    array2d.h \
    row.h
