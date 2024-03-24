import QtQuick 2.0
import QtQuick.Layouts 1.12
import "../Buttons"

Item{
    id: saveItem

    width: seatSaves.height * 0.65
    height: seatSaves.height

    property int buttonId: 0

    Layout.minimumWidth: saveItem.width
    Layout.preferredWidth: saveItem.width
    Layout.maximumWidth: saveItem.width

    Layout.fillHeight: true
    Layout.alignment: Qt.AlignHCenter

    // Initialize save values with default values
    property real savedHeadrestHeight: globalSettings.headrestHeight
    property real savedBackrestAngle: globalSettings.backrestAngle
    property real savedSeatHardness: globalSettings.seatHardness
    property real savedFootrestAngle: globalSettings.footrestAngle

    Component.onCompleted: {
        saveItem.savedHeadrestHeight = globalSettings.headrestHeight
        saveItem.savedBackrestAngle = globalSettings.backrestAngle
        saveItem.savedSeatHardness = globalSettings.seatHardness
        saveItem.savedFootrestAngle = globalSettings.footrestAngle
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


