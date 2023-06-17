import QtQuick
import QtQuick.Window 2.5
import QtQuick.Controls 2.14

Window {
    minimumWidth: 320
    minimumHeight: 230
    width: 640
    height: 480
    visible: true
    title: qsTr("Player")
    color: "grey"

    RoundButton
    {
        id: otherButton
        width: 30
        height: 30
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 20

        property bool isPaused: false

        onClicked: {
            if (isPaused) {
                contentItem.text = "▶️"
                isPaused = false
            }
            else
            {
                contentItem.text = "⏸"
                isPaused = true
             }
        }

        contentItem: Text {
            text: "▶️"
            color: "white"
            font.pixelSize: 15
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        background: Rectangle {
            radius: width / 2
            color: "orange"
        }
    }

    Button
    {
        id: backButton
        width: 30
        height: 30
        anchors.bottom: parent.bottom
        anchors.right: otherButton.left
        anchors.bottomMargin: 22
        anchors.rightMargin: 60
        contentItem: Text
        {
            text: "⏪️"
            color: "white"
            font.pixelSize: Math.min(backButton.width, backButton.height) * 0.8
            horizontalAlignment: Text.AlighHCenter
            verticalAlignment: Text.AlighVCenter
        }
        background: Rectangle
        {
            color: "transparent"
        }
    }

    Button
    {
        id: forwardButton
        width: 30
        height: 30
        anchors.bottom: parent.bottom
        anchors.left: otherButton.right
        anchors.bottomMargin: 22
        anchors.leftMargin: 60
        contentItem: Text {
            text: "⏩️"
            color: "white"
            font.pixelSize: Math.min(forwardButton.width, forwardButton.height) * 0.8
            horizontalAlignment: Text.AlighHCenter
            verticalAlignment: Text.AlighVCenter
        }
        background: Rectangle
        {
            color:"transparent"
        }
    }

    Button
    {
        id: stopButton
        width: 30
        height: 30
        anchors.bottom: parent.bottom
        anchors.left: otherButton.right
        anchors.bottomMargin: 22
        anchors.leftMargin: 20
        contentItem: Text {
            text: "⏹"
            color: "white"
            font.pixelSize: Math.min(stopButton.width, stopButton.height) * 0.8
            horizontalAlignment: Text.AlighHCenter
            verticalAlignment: Text.AlighVCenter
        }
        background: Rectangle
        {
            color: "transparent"
        }
    }

    Button
    {
        id: speedButton
        width: 30
        height: 30
        anchors.bottom:parent.bottom
        anchors.right: otherButton.left
        anchors.bottomMargin: 18
        anchors.rightMargin:20
        ToolTip.visible: hovered
        ToolTip.text: "Payback speed"

        onClicked: menu.open()

        Menu {
            id: menu
            y: speedButton.height

            MenuItem {
                    text: "0.5x"
                    onTriggered:
                    {
                        speedButtonText.text = "0.5x"
                    }
                }
                MenuItem {
                    text: "0.75x"
                    onTriggered:
                    {
                        speedButtonText.text = "0.75x"
                    }
                }
                MenuItem {
                    text: "1.0x"
                    onTriggered:
                    {
                        speedButtonText.text = "1.0x"
                    }
                }
                MenuItem {
                    text: "1.25x"
                    onTriggered:
                    {
                        speedButtonText.text = "1.25x"
                    }
                }
                MenuItem {
                    text: "1.5x"
                    onTriggered:
                    {
                        speedButtonText.text = "1.5x"
                    }
                }
                MenuItem {
                    text: "2.0x"
                    onTriggered:
                    {
                        speedButtonText.text = "2.0x"
                    }
                }
        }

        contentItem: Text {
            id: speedButtonText
            text: "1.0x"
            color: "white"
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        background: Rectangle
        {
            color: "transparent"
        }
    }

    Slider {
        id: control
        width: parent.width * 0.9
        height: 5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 60
        value:0.25

        background: Rectangle
        {
            x: control.leftPadding
            y: control.topPadding + control.availableHeight / 2 - height / 2
            radius: height / 2
            implicitHeight: control.height
            implicitWidth: control.width
            color: "#E7E6B1"
        }

        Rectangle
        {
            x: control.leftPadding
            y: control.topPadding + control.availableHeight / 2 - height / 2
            radius: height / 2
            implicitHeight: control.height
            implicitWidth: control.width * control.value
            color: "yellow"
        }
        handle: Rectangle
        {
            x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
            y: control.topPadding + control.availableHeight / 2 - height / 2
            implicitWidth: 18
            implicitHeight: 18
            radius: implicitHeight / 2
            color: "orange"
        }

    }
}
