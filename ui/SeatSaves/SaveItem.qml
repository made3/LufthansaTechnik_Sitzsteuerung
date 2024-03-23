import QtQuick 2.0
import QtQuick.Layouts 1.12
import "../Buttons"

Item{
    id: saveItem

    width: seatSaves.height * 0.7
    height: parent.height

    property int buttonId: 0

    Layout.alignment: Qt.AlignHCenter

    // Initialize save values with default values
    property real savedHeadrestHeight: headrestHeight
    property real savedBackrestAngle: backrestAngle
    property real savedSeatHardness: seatHardness
    property real savedFootrestAngle: footrestAngle

    Component.onCompleted: {
        saveItem.savedHeadrestHeight = headrestHeight
        saveItem.savedBackrestAngle = backrestAngle
        saveItem.savedSeatHardness = seatHardness
        saveItem.savedFootrestAngle = footrestAngle
    }


    // topButton
    SaveTopButton{
        id: topButton
    }

    // bottomButton
    SaveBottomButton{
        id: bottomButton
    }

}


