QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

#verion header generator
VHDR_PATH_NAME = $$PWD/uversion.h
VHDR_GEN_SCRIPT = $$PWD/../../generate_version_header
include(../../generate_version_header/generate_version_header.pri)

SOURCES += \
    main.cpp \
    mainwindow.cpp

HEADERS += \
    mainwindow.h

FORMS += \
    mainwindow.ui
