import QtQuick 2.0
import QtQuick.Layouts 1.12
import "../Buttons"
import "../Settings"

Rectangle{
    id: seatControls

    anchors{
        top: seat.bottom
        left: parent.left
        right: parent.right
        bottom: parent.bottom

        bottomMargin: 10
    }

    color: "transparent"

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
