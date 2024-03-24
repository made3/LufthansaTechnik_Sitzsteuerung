import QtQuick 2.0
import QtGraphicalEffects 1.0

import "../Buttons"
import "../SeatControls"
import "../Settings"

Rectangle{
    id: seat
    height: heightRatio * 7
    color: "transparent"

    // Save positions and make it not interactable
    property bool fixedPositions: false
    enabled: !fixedPositions

    property real fixedHeadrestHeight
    property real fixedBackrestAngle
    property real fixedSeatHardness
    property real fixedFootrestAngle


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
                GradientStop { position: 0.0; color: fixedPositions ? "#b1bbc4" : Qt.lighter(mainWindow.backgroundColor, 1.5) }
                GradientStop { position: 0.5; color: "transparent" }
            }
        }


        Item{
            id: seatParentTransform
            x: parent.width * 0.45
            y: parent.height * 0.6


            // Backrest and Headrest. Headrest is child of Backrest to be rotated with backrest
            SeatPartButton{
                id: backrestPartButton

                height: seatPartsRect.width * 0.055 * seatPartsRect.seatScaleFactor
                width: seatPartsRect.height * 0.25 * seatPartsRect.seatScaleFactor

                x: - width + seatPartButton.height / 2
                y: - seatPartButton.height / 2

                transform: Rotation {
                    origin.x: backrestPartButton.width - seatPartButton.height / 2
                    origin.y: backrestPartButton.height / 2
                    angle: fixedPositions ? fixedBackrestAngle : globalSettings.backrestAngle
                }

                onClicked:{
                    globalSettings.selectedPart = GlobalSettings.SeatPart.Backrest
                }


                // Headrest as child of backrest to simply stay in place with the rotation
                SeatPartButton{
                    id: headrestPartButton

                    height: seatPartsRect.width * 0.035 * seatPartsRect.seatScaleFactor
                    width: seatPartsRect.height * 0.075 * seatPartsRect.seatScaleFactor

                    property real baseHeight: -seatPartsRect.partPadding - width

                    y: (backrestPartButton.height - headrestPartButton.height) / 2
                    x: baseHeight - globalSettings.headrestToPercent(fixedPositions ? fixedHeadrestHeight : globalSettings.headrestHeight) * height / 4

                    onClicked: {
                        globalSettings.selectedPart = GlobalSettings.SeatPart.Headrest
                    }
                }
            }

            // Footrest
            SeatPartButton{
                id: footrestPartButton

                x: seatPartButton.x + seatPartButton.width - seatPartButton.height
                y: - seatPartButton.height / 2

                width: seatPartsRect.width * 0.055 * seatPartsRect.seatScaleFactor
                height: seatPartsRect.height * 0.2 * seatPartsRect.seatScaleFactor

                transform: Rotation {
                    origin.x: footrestPartButton.width / 2
                    origin.y: footrestPartButton.width / 2
                    angle: fixedPositions ? -fixedFootrestAngle : -globalSettings.footrestAngle
                }

                onClicked: {
                    globalSettings.selectedPart = GlobalSettings.SeatPart.Footrest
                }
            }

            // Seat
            SeatPartButton{
                id: seatPartButton

                x: - seatPartButton.height / 2
                y: - seatPartButton.height / 2

                width: seatPartsRect.height * 0.2 * seatPartsRect.seatScaleFactor
                height: seatPartsRect.width * 0.055 * seatPartsRect.seatScaleFactor

                usedColor:{
                    var hardness = fixedPositions ? fixedSeatHardness : globalSettings.seatHardness
                    hardness = 1 - (hardness / 150) // Normalize by dividing by 150, so that the max value is not full black
                    var newColor = Qt.rgba(hardness, hardness, hardness, 1)
                    return newColor
                }

                onClicked: {
                    globalSettings.selectedPart = GlobalSettings.SeatPart.Seat
                }
            }

        }
    }
}
