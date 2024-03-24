import QtQuick 2.0
import QtQuick.Layouts 1.12
import "../Buttons"
import "../Settings"

Rectangle{
    id: seatControls

//    enum SeatPart {
//        None,
//        Headrest,
//        Backrest,
//        Seat,
//        Footrest
//    }

//    property int selectedPart: SeatControls.SeatPart.None


    anchors{
        top: seat.bottom
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }

    color: "transparent"



    // DEBUG
    Keys.onDigit1Pressed: selectedPart = GlobalSettings.SeatPart.None
    Keys.onDigit2Pressed: selectedPart = GlobalSettings.SeatPart.Headrest
    Keys.onDigit3Pressed: selectedPart = GlobalSettings.SeatPart.Backrest
    Keys.onDigit4Pressed: selectedPart = GlobalSettings.SeatPart.Seat
    Keys.onDigit5Pressed: selectedPart = GlobalSettings.SeatPart.Footrest



    RowLayout{
        id: buttonLayout

        width: seatControls.height * 3

        anchors{
            top: seatControls.top
            bottom: seatControls.bottom
            horizontalCenter: parent.horizontalCenter
        }

        // Left Button
        ControlButton{
            leftButton: true

            Layout.minimumWidth: seatControls.height
            Layout.preferredWidth: seatControls.height
            Layout.maximumWidth: seatControls.height

            Layout.fillHeight: true
        }

        // Information
        SeatControlsInformation{
            Layout.minimumWidth: seatControls.height
            Layout.preferredWidth: seatControls.height
            Layout.maximumWidth: seatControls.height

            Layout.margins: 10

            Layout.fillHeight: true
        }

        // Right Button
        ControlButton{
            leftButton: false

            Layout.minimumWidth: seatControls.height
            Layout.preferredWidth: seatControls.height
            Layout.maximumWidth: seatControls.height

            Layout.fillHeight: true
        }

    }








}
