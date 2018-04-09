/*
 *         DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
 *                   Version 2, December 2004
 *
 * Copyright (C) 2018 Alex Spataru <https://github.com/alex-spataru>
 *
 * Everyone is permitted to copy and distribute verbatim or modified
 * copies of this license document, and changing it is allowed as long
 * as the name is changed.
 *
 *            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
 *   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
 *
 *  0. You just DO WHAT THE FUCK YOU WANT TO.
 */

import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0

ApplicationWindow {
    id: app

    //
    // Geometry options
    //
    width: 600
    height: 480
    visible: true

    //
    // Theming stuff
    //
    Rectangle {
        id: bg
        color: "#000"
        anchors.fill: parent
    }

    //
    // Global variables
    //
    readonly property int spacing: 16

    //
    // Main user interface
    //
    ColumnLayout {
        spacing: app.spacing
        anchors.centerIn: parent

        Item {
            Layout.fillHeight: true
        }

        Item {
            width: image.width
            height: image.height
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                id: image
                sourceSize: Qt.size (196, 196)
                source: "qrc:/images/logo.svg"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            MouseArea {
                id: mouseArea

                property int numberOfTaps: 0

                Timer {
                    id: timer
                    interval: 800
                    onTriggered: mouseArea.numberOfTaps = 0
                }

                anchors.fill: parent
                onClicked: {
                    ++mouseArea.numberOfTaps

                    timer.stop()
                    timer.start()

                    var text = ""

                    switch (numberOfTaps) {
                    case 3:
                        text = qsTr ("You've tapped 3 times!")
                        break
                    case 10:
                        text = qsTr ("Oh great, 10 times")
                        break
                    case 20:
                        text = qsTr ("The hell are you doing?")
                        break
                    case 30:
                        text = qsTr ("You look very stupid")
                        break
                    case 42:
                        text = qsTr ("You won't find the meaning of 42 here")
                        break
                    case 64:
                        text = qsTr ("64 taps and counting...")
                        break
                    case 96:
                        text = qsTr ("You have a disseased mind")
                        break
                    case 250:
                        text = qsTr ("I've bet you broke your finger by now")
                        break
                    case 1000:
                        text = qsTr ("1000 times, do you have a life??")
                        break
                    }

                    if (text.length > 0) {
                        message.text = text
                        message.visible = true
                    }
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }

        Label {
            color: "#fff"
            font.bold: true
            font.italic: true
            font.pixelSize: 14
            Layout.maximumWidth: app.width * 0.9
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr ("Thanks for purchasing the \"One Dollar App\"")
        }

        Label {
            color: "#aaa"
            font.italic: true
            Layout.maximumWidth: app.width * 0.9
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            anchors.horizontalCenter: parent.horizontalCenter
            text: "~ " + qsTr ("You just helped me feed my cat") + " ~"

            MouseArea {
                anchors.fill: parent
                onClicked: cat.opacity = !cat.opacity
            }
        }

        Item {
            Layout.fillHeight: true
        }

        Repeater {
            id: buttons
            model: data.length

            readonly property var data: [
                [qsTr ("Rate"), "https://www.reddit.com/r/AskReddit/comments/1nfxnw/whats_the_stupidest_purchase_you_ever_made"],
                [qsTr ("Licence"), "https://github.com/alex-spataru/one-dollar-app/blob/master/LICENCE.md"],
                [qsTr ("More ideas") + "...", "https://www.reddit.com/r/AskReddit/comments/1nfxnw/whats_the_stupidest_purchase_you_ever_made"],
            ]

            Rectangle {
                width: 240
                height: 28
                color: "#222"
                radius: width / 2
                anchors.horizontalCenter: parent.horizontalCenter

                Label {
                    id: label
                    color: "#dedede"
                    font.pixelSize: 14
                    anchors.centerIn: parent
                    text: buttons.data [index][0]
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: Qt.openUrlExternally (buttons.data [index][1])
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }

    //
    // Image of Artois
    //
    Item {
        id: cat
        opacity: 0
        anchors.fill: parent

        onOpacityChanged: {
            if (opacity == 1) {
                message.text = qsTr ("Double tap Artois to hide him")
                message.visible = true
            }
        }

        Rectangle {
            color: bg.color
            anchors.fill: parent
        }

        Image {
            smooth: true
            anchors.fill: parent
            anchors.margins: app.spacing
            source: "qrc:/images/artois.png"
            fillMode: Image.PreserveAspectFit
        }

        MouseArea {
            anchors.fill: parent
            enabled: parent.opacity === 1
            onDoubleClicked: parent.opacity = 0
        }

        Behavior on opacity { NumberAnimation {} }
    }

    //
    // Tooltip
    //
    ToolTip {
        id: message
        timeout: 2000
    }
}
