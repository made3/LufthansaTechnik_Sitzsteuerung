import QtQuick 2.0
import QtQuick.Controls 2.5

Button {
    id: seatPartButton

    property color baseColor: "white"
    property color usedColor: "white"

    background: Rectangle {
        color: seatPartButton.down ? Qt.darker(usedColor, 1.2) : usedColor
        border.width: seat.width/640 // On full scale (640px) border width is 1. This way it scaled according to scale
        radius: 100
    }
}

