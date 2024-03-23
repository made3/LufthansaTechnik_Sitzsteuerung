import QtQuick 2.0
import QtQuick.Controls 2.5

Button {

    property color backgroundColor: "yellow"
    property color backgroundColorPressed: Qt.darker(backgroundColor, 1.2)


    height: parent.width

    anchors{
        top: parent.top
        left: parent.left
        right: parent.right

//        margins: 5
    }

    text: saveItem.buttonId

    background: Rectangle{
        color: topButton.down ? topButton.backgroundColorPressed : topButton.backgroundColor
        radius: 4

//        Image{
//            anchors.fill: parent
//            anchors.margins: 10
//            source: buttonImage
//        }
    }

    onClicked: {
        // Save current values
        headrestHeight = saveItem.savedHeadrestHeight
        backrestAngle = saveItem.savedBackrestAngle
        seatHardness = saveItem.savedSeatHardness
        footrestAngle = saveItem.savedFootrestAngle
    }
}
