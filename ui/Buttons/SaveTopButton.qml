 import QtQuick 2.0
import QtQuick.Controls 2.5
import "../Seat"
import "../Settings"

Button {
    id: saveTopButton
    property color backgroundColor: "#a5a9ad"
    property color backgroundColorPressed: Qt.darker(backgroundColor, 1.2)

    height: parent.width

    anchors{
        top: parent.top
        left: parent.left
        right: parent.right
    }

    Seat{
        fixedPositions: true
        anchors.fill: parent
        anchors.topMargin: 20

        fixedHeadrestHeight: saveItem.savedHeadrestHeight
        fixedBackrestAngle: saveItem.savedBackrestAngle
        fixedSeatHardness: saveItem.savedSeatHardness
        fixedFootrestAngle: saveItem.savedFootrestAngle
    }

    Text{
        text: "SAVE " + saveItem.buttonId

        height: parent.height * 0.2

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        fontSizeMode: Text.Fit
        minimumPixelSize: 4

        font{
            family: "MS UI Gothic"
            pointSize: 72
            bold: true
        }

        color: "black"

        anchors{
            top: parent.top
            left: parent.left
            right: parent.right

            topMargin: 5
        }
    }


    background: Rectangle{
        color: topButton.down ? topButton.backgroundColorPressed : topButton.backgroundColor
        radius: 4


    }

    onClicked: {
        // Save current values
        globalSettings.headrestHeight = saveItem.savedHeadrestHeight
        globalSettings.backrestAngle = saveItem.savedBackrestAngle
        globalSettings.seatHardness = saveItem.savedSeatHardness
        globalSettings.footrestAngle = saveItem.savedFootrestAngle
    }
}
