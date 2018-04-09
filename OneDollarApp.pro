#
#        DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
# Copyright (C) 2018 Alex Spataru <https://github.com/alex-spataru/>
#
# Everyone is permitted to copy and distribute verbatim or modified
# copies of this license document, and changing it is allowed as long
# as the name is changed.
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#

#-------------------------------------------------------------------------------
# Make options
#-------------------------------------------------------------------------------

UI_DIR = uic
MOC_DIR = moc
RCC_DIR = qrc
OBJECTS_DIR = obj

#-------------------------------------------------------------------------------
# Qt configuration
#-------------------------------------------------------------------------------

TEMPLATE = app
TARGET = one-dollar-app

CONFIG += qtc_runnable

QT += xml
QT += svg
QT += core
QT += quick
QT += quickcontrols2

#-------------------------------------------------------------------------------
# Include source code
#-------------------------------------------------------------------------------

HEADERS += \
    src/version.h

SOURCES += \
    src/main.cpp \
    src/version.cpp

DISTFILES += \
    assets/qml/main.qml \
    deploy/android/AndroidManifest.xml \
    deploy/android/gradle/wrapper/gradle-wrapper.jar \
    deploy/android/gradlew \
    deploy/android/res/values/libs.xml \
    deploy/android/build.gradle \
    deploy/android/gradle/wrapper/gradle-wrapper.properties \
    deploy/android/gradlew.bat

RESOURCES += \
    assets/images/images.qrc \
    assets/qml/qml.qrc

#-------------------------------------------------------------------------------
# Deploy options
#-------------------------------------------------------------------------------

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/deploy/android
