import QtQuick 2.0
import QtQuick.Layouts 1.12

import "../SeatControls"

Item{
    id: seatSaves
    height: heightRatio * 2

    property int buttonCount: 4

    anchors{
        top: parent.top
        left: parent.left
        right: parent.right
    }

    RowLayout{
        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10

        Repeater{
            model: buttonCount
            SaveItem{
                buttonId: index + 1
            }
        }
    }
}
