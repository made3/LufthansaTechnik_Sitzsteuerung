import QtQuick 2.12
import QtQuick.Window 2.12
import "ui/Seat"
import "ui/SeatControls"
import "ui/SeatSaves"
import '.'
import "ui/Settings"
Window {
    id: mainWindow
    visible: true
    width: 640
    height: 960
    title: qsTr("Sitzsteuerung")

    color: mainWindow.backgroundColor

    property real heightRatio: height / 10
    property color backgroundColor: "#151a24"

    GlobalSettings{
        id: globalSettings
    }

    SeatSaves{
        id: seatSaves
    }

    Seat{
        id: seat
        anchors{
            top: seatSaves.bottom
            left: parent.left
            right: parent.right
        }
    }

    SeatControls{
        id: seatControls
    }


}
