 import QtQuick 2.0
import QtQuick.Controls 2.5
import "../Seat"
import "../Settings"

Button {
    id: saveTopButton
    property color backgroundColor: "yellow"
    property color backgroundColorPressed: Qt.darker(backgroundColor, 1.2)


    height: parent.width

    anchors{
        top: parent.top
        left: parent.left
        right: parent.right
    }

    Seat{
        id: testSeat
        fixedPositions: true
        anchors.fill: parent

        fixedHeadrestHeight: saveItem.savedHeadrestHeight
        fixedBackrestAngle: saveItem.savedBackrestAngle
        fixedSeatHardness: saveItem.savedSeatHardness
        fixedFootrestAngle: saveItem.savedFootrestAngle

    }

//    Text{
//        text: "SAVED\nPOSITION\n\n" + saveItem.buttonId

//        horizontalAlignment: Text.AlignHCenter
//        verticalAlignment: Text.AlignVCenter
//        fontSizeMode: Text.Fit
//        minimumPixelSize: 4

//        font{
//            family: "MS UI Gothic"
//            pointSize: 72
//        }

//        color: "black"

//        anchors.fill: saveTopButton
//    }


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
