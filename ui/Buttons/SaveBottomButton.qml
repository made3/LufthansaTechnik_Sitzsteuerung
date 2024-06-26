import QtQuick 2.5
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0

Button {
    width: bottomButton.height

    property color backgroundColor: "#cccfd9"
    property color backgroundColorPressed: Qt.darker(backgroundColor, 1.2)


    anchors{
        top: topButton.bottom
        bottom: parent.bottom
        horizontalCenter: parent.horizontalCenter

        margins: 10

    }

    LinearGradient {
        anchors.fill: parent
        source: roundedRect
        start: Qt.point(width, 0)
        end: Qt.point(0, height)
        gradient: Gradient {
            GradientStop { position: 1.0; color: bottomButton.down ? bottomButton.backgroundColorPressed : bottomButton.backgroundColor }
            GradientStop { position: 0.0; color: bottomButton.down ? Qt.lighter(bottomButton.backgroundColorPressed, 2): Qt.lighter(bottomButton.backgroundColor, 2) }
        }
    }

    background: Rectangle{
        id: roundedRect
        radius: 4
    }

    Image{
        anchors.fill: parent
        anchors.margins: 10
        source: "Icons/Save.png"
    }

    onClicked: {
        saveItem.savedHeadrestHeight = globalSettings.headrestHeight
        saveItem.savedBackrestAngle = globalSettings.backrestAngle
        saveItem.savedSeatHardness = globalSettings.seatHardness
        saveItem.savedFootrestAngle = globalSettings.footrestAngle
    }
}
