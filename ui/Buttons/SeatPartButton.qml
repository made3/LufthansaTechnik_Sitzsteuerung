import QtQuick 2.0
import QtQuick.Controls 2.5

Button {
    id: seatPartButton

    property color baseColor: "white"
    property color usedColor: "white"

    background: Rectangle {
//        opacity: enabled ? 1 : 0.3
        color: seatPartButton.down ? Qt.darker(usedColor, 1.2) : usedColor
//        border.width: 1
        radius: seatPartsRect.width/50
    }
}

