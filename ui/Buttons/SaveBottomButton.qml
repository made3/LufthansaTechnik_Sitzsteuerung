import QtQuick 2.0
import QtQuick.Controls 2.5

Button {
    height: parent.width
    width: height

    property color backgroundColor: "red"
    property color backgroundColorPressed: Qt.darker(backgroundColor, 1.2)


    anchors{
        top: topButton.bottom
        bottom: parent.bottom
        horizontalCenter: parent.horizontalCenter

        margins: 5

    }

    background: Rectangle{
        color: bottomButton.down ? bottomButton.backgroundColorPressed : bottomButton.backgroundColor
        radius: 4

//        Image{
//            anchors.fill: parent
//            anchors.margins: 10
//            source: buttonImage
//        }
    }

    onClicked: {
        saveItem.savedHeadrestHeight = headrestHeight
        saveItem.savedBackrestAngle = backrestAngle
        saveItem.savedSeatHardness = seatHardness
        saveItem.savedFootrestAngle = footrestAngle
    }
}
