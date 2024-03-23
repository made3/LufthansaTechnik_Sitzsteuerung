import QtQuick 2.0
import QtGraphicalEffects 1.0

import "../Buttons"
import "../SeatControls"

Rectangle{
    id: seat
    height: heightRatio * 7
    color: "transparent"

    anchors{
        top: seatSaves.bottom
        left: parent.left
        right: parent.right
    }

    // Rectangle that contains all seat parts. Centered in parent with margin and always same ratio
    Rectangle{
        id: seatPartsRect
        property real rectScale: parent.height > parent.width ? parent.width : parent.height
        property real rectMargin: 0.9

        color: "transparent"

        anchors.centerIn: parent

        height: rectScale * rectMargin
        width: rectScale * rectMargin


        // Padding between each seat part
        property int partPadding: height * 0.01
        property real seatScaleFactor: 1.2


        RadialGradient {
            anchors.fill: parent
            gradient: Gradient {
                GradientStop { position: 0.0; color: Qt.lighter(mainWindow.backgroundColor, 1.5) }
                GradientStop { position: 0.5; color: "transparent" }
            }
        }


        Item{
            id: seatParentTransform
            x: parent.width * 0.45
            y: parent.height * 0.6


            // Backrest and Headrest
            SeatPartButton{
                id: backrestPartButton

                width: seatPartsRect.width * 0.055 * seatPartsRect.seatScaleFactor
                height: seatPartsRect.height * 0.25 * seatPartsRect.seatScaleFactor

                x: -width / 2
                y: -height + seatPartButton.height / 2

                transform: Rotation {
                    origin.x: backrestPartButton.width / 2
                    origin.y: backrestPartButton.height - backrestPartButton.width / 2
                    angle: backrestAngle
                }

                onClicked:{
                    seatControls.selectedPart = SeatControls.SeatPart.Backrest
                }


                // Headrest as child of backrest to simply stay in place with the rotation
                SeatPartButton{
                    id: headrestPartButton

                    width: seatPartsRect.width * 0.035 * seatPartsRect.seatScaleFactor
                    height: seatPartsRect.height * 0.075 * seatPartsRect.seatScaleFactor

                    property real baseHeight: -seatPartsRect.partPadding - height

                    x: backrestPartButton.width / 2 - width / 2
                    y: baseHeight - mainWindow.headrestToPercent() * height / 4


                    onClicked: {
                        seatControls.selectedPart = SeatControls.SeatPart.Headrest
                    }
                }
            }

            // Footrest
            SeatPartButton{
                id: footrestPartButton

                x: seatPartButton.x + seatPartButton.width - seatPartButton.height
                y: - footrestPartButton.height / 2

                width: seatPartsRect.height * 0.2 * seatPartsRect.seatScaleFactor
                height: seatPartsRect.width * 0.055 * seatPartsRect.seatScaleFactor

                transform: Rotation {
                    origin.x: footrestPartButton.height / 2
                    origin.y: footrestPartButton.height / 2
                    angle: footrestAngle
                }

                onClicked: {
                    seatControls.selectedPart = SeatControls.SeatPart.Footrest
                }
            }

            // Seat
            SeatPartButton{
                id: seatPartButton

                x: - seatPartButton.height / 2
                y: - seatPartButton.height / 2

                width: seatPartsRect.height * 0.2 * seatPartsRect.seatScaleFactor
                height: seatPartsRect.width * 0.055 * seatPartsRect.seatScaleFactor

                usedColor: Qt.darker(baseColor, seatHardness / 10 * 0.5)

                onClicked: {
                    seatControls.selectedPart = SeatControls.SeatPart.Seat
                }
            }

        }
    }
}
