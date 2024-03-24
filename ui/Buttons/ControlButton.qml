import QtQuick 2.0
import QtQuick.Controls 2.5
import '.'
import QtGraphicalEffects 1.0

Button {
    id: controlButton

    property bool leftButton

    property color backgroundColor: "#cccfd9"
    property color backgroundColorPressed: Qt.darker(backgroundColor, 1.2)

    property string buttonImage: {
        switch(globalSettings.selectedPart){
        case 1: // Headrest
            leftButton ? "Icons/ArrowDown.png" : "Icons/ArrowUp.png"
            break
        case 2: // Backrest
            leftButton ? "Icons/ArrowLeft.png" : "Icons/ArrowRight.png"
            break
        case 3: // Seat
            leftButton ? "Icons/ArrowDown.png" : "Icons/ArrowUp.png"
            break
        case 4: // Footrest
            leftButton ? "Icons/ArrowLeft.png" : "Icons/ArrowRight.png"
            break
        case 0: // None
        default:
            ""
            break
        }
    }

    LinearGradient {
        anchors.fill: parent
        source: roundedRect
        start: Qt.point(width, 0)
        end: Qt.point(0, height)
        gradient: Gradient {
            GradientStop { position: 1.0; color: controlButton.down ? controlButton.backgroundColorPressed : controlButton.backgroundColor }
            GradientStop { position: 0.0; color: controlButton.down ? Qt.lighter(controlButton.backgroundColorPressed, 2): Qt.lighter(controlButton.backgroundColor, 2) }
        }
    }

    background: Rectangle{
        id: roundedRect
        radius: 4
        color: globalSettings.selectedPart == 0 ? "transparent" : "white"
    }

    Image{
        anchors.fill: parent
        anchors.margins: 10
        source: buttonImage
    }


    Timer{
        id: leftButtonTimer
        interval: 10
        running: leftButton ? controlButton.pressed : false
        repeat: true

        onTriggered: {
            adjustControlValue(false)
        }
    }

    Timer{
        id: rightButtonTimer
        interval: 10
        running: leftButton ? false : controlButton.pressed
        repeat: true

        onTriggered: {
            adjustControlValue(true)
        }
    }

    property real normalizedDelta: 0
    property real percentPerTrigger: 0.001

    property real headrestSpeedFactor: 2
    property real backrestSpeedFactor: 1
    property real seatHardnessSpeedFactor: 2
    property real footrestSpeedFactor: 1

    function adjustControlValue(increase){

        if(increase){
            switch(globalSettings.selectedPart){
            case 1: // Headrest
                normalizedDelta = Math.abs((globalSettings.headrestMax - globalSettings.headrestMin)) * percentPerTrigger // Delta: Decrease value for 0.001% of the value span with each timer trigger
                if((globalSettings.headrestHeight - normalizedDelta) > globalSettings.headrestMax)
                    globalSettings.headrestHeight = globalSettings.headrestMax
                else
                    globalSettings.headrestHeight += normalizedDelta * headrestSpeedFactor
                break
            case 2: // Backrest
                normalizedDelta = Math.abs((globalSettings.backrestMax - globalSettings.backrestMin)) * percentPerTrigger // Delta: Decrease value for 0.001% of the value span with each timer trigger
                if((globalSettings.backrestAngle - normalizedDelta) > globalSettings.backrestMax)
                    globalSettings.backrestAngle = globalSettings.backrestMax
                else
                    globalSettings.backrestAngle += normalizedDelta * backrestSpeedFactor
                break
            case 3: // Seat
                normalizedDelta = Math.abs((globalSettings.seatMax - globalSettings.seatMin)) * percentPerTrigger // Delta: Decrease value for 0.001% of the value span with each timer trigger
                if((globalSettings.seatHardness - normalizedDelta) > globalSettings.seatMax)
                    globalSettings.seatHardness = globalSettings.seatMax
                else
                    globalSettings.seatHardness += normalizedDelta * seatHardnessSpeedFactor
                break
            case 4: // Footrest
                normalizedDelta = Math.abs((globalSettings.footrestMax - globalSettings.footrestMin)) * percentPerTrigger // Delta: Decrease value for 0.001% of the value span with each timer trigger
                if((globalSettings.footrestAngle - normalizedDelta) > globalSettings.footrestMax)
                    globalSettings.footrestAngle = globalSettings.footrestMax
                else
                    globalSettings.footrestAngle += normalizedDelta * footrestSpeedFactor
                break
            case 0: // None
            default:
                break
            }
        }else{
            switch(globalSettings.selectedPart){
            case 1: // Headrest
                normalizedDelta = Math.abs((globalSettings.headrestMax - globalSettings.headrestMin)) * percentPerTrigger // Delta: Decrease value for 0.001% of the value span with each timer trigger
                if((globalSettings.headrestHeight - normalizedDelta) < globalSettings.headrestMin)
                    globalSettings.headrestHeight = globalSettings.headrestMin
                else
                    globalSettings.headrestHeight -= normalizedDelta * headrestSpeedFactor
                break
            case 2: // Backrest
                normalizedDelta = Math.abs((globalSettings.backrestMax - globalSettings.backrestMin)) * percentPerTrigger // Delta: Decrease value for 0.001% of the value span with each timer trigger
                if((globalSettings.backrestAngle - normalizedDelta) < globalSettings.backrestMin)
                    globalSettings.backrestAngle = globalSettings.backrestMin
                else
                    globalSettings.backrestAngle -= normalizedDelta * backrestSpeedFactor
                break
            case 3: // Seat
                normalizedDelta = Math.abs((globalSettings.seatMax - globalSettings.seatMin)) * percentPerTrigger // Delta: Decrease value for 0.001% of the value span with each timer trigger
                if((globalSettings.seatHardness - normalizedDelta) < globalSettings.seatMin)
                    globalSettings.seatHardness = globalSettings.seatMin
                else
                    globalSettings.seatHardness -= normalizedDelta * seatHardnessSpeedFactor
                break
            case 4: // Footrest
                normalizedDelta = Math.abs((globalSettings.footrestMax - globalSettings.footrestMin)) * percentPerTrigger // Delta: Decrease value for 0.001% of the value span with each timer trigger
                if((globalSettings.footrestAngle - normalizedDelta) < globalSettings.footrestMin)
                    globalSettings.footrestAngle = globalSettings.footrestMin
                else
                    globalSettings.footrestAngle -= normalizedDelta * footrestSpeedFactor
                break
            case 0: // None
            default:
                break
            }
        }

    }
}
