import QtQuick 2.0
import QtQuick.Controls 2.5
import '.'
import QtGraphicalEffects 1.0

Button {
    id: controlButton

    property bool leftButton

    property color backgroundColor: "#b4b7bf"
    property color backgroundColorPressed: Qt.darker(backgroundColor, 1.2)

    property string buttonImage: {
        switch(seatControls.selectedPart){
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

    onPressed: leftButton ? leftButtonTimer.start() : rightButtonTimer.start()
    onReleased: leftButton ? leftButtonTimer.stop() : rightButtonTimer.stop()



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
    }

    Image{
        anchors.fill: parent
        anchors.margins: 10
        source: buttonImage
    }


//    background: Rectangle{
//        color: controlButton.down ? controlButton.backgroundColorPressed : controlButton.backgroundColor
//        radius: 50

//        Image{
//            anchors.fill: parent
//            anchors.margins: 10
//            source: buttonImage
//        }
//    }


    Timer{
        id: leftButtonTimer
        interval: 10
        running: false
        repeat: true

        onTriggered: {
            adjustControlValue(false)
        }
    }


    Timer{
        id: rightButtonTimer
        interval: 10
        running: false
        repeat: true

        onTriggered: {
            adjustControlValue(true)
        }
    }

    property real normalizedDelta: 0
    property real percentPerTrigger: 0.001

    function adjustControlValue(increase){

        if(increase){
            switch(seatControls.selectedPart){
            case 1: // Headrest
                normalizedDelta = Math.abs((headrestMax - headrestMin)) * percentPerTrigger // Delta: Decrease value for 0.001% of the value span with each timer trigger
                if((headrestHeight - normalizedDelta) > headrestMax)
                    headrestHeight = headrestMax
                else
                    headrestHeight += normalizedDelta
                break
            case 2: // Backrest
                normalizedDelta = Math.abs((backrestMax - backrestMin)) * percentPerTrigger // Delta: Decrease value for 0.001% of the value span with each timer trigger
                if((backrestAngle - normalizedDelta) > backrestMax)
                    backrestAngle = backrestMax
                else
                    backrestAngle += normalizedDelta
                break
            case 3: // Seat
                normalizedDelta = Math.abs((seatMax - seatMin)) * percentPerTrigger // Delta: Decrease value for 0.001% of the value span with each timer trigger
                if((seatHardness - normalizedDelta) > seatMax)
                    seatHardness = seatMax
                else
                    seatHardness += normalizedDelta
                break
            case 4: // Footrest
                normalizedDelta = Math.abs((footrestMax - footrestMin)) * percentPerTrigger // Delta: Decrease value for 0.001% of the value span with each timer trigger
                if((footrestAngle - normalizedDelta) > footrestMax)
                    footrestAngle = footrestMax
                else
                    footrestAngle += normalizedDelta
                break
            case 0: // None
            default:
                break
            }
        }else{
            switch(seatControls.selectedPart){
            case 1: // Headrest
                normalizedDelta = Math.abs((headrestMax - headrestMin)) * percentPerTrigger // Delta: Decrease value for 0.001% of the value span with each timer trigger
                if((headrestHeight - normalizedDelta) < headrestMin)
                    headrestHeight = headrestMin
                else
                    headrestHeight -= normalizedDelta
                break
            case 2: // Backrest
                normalizedDelta = Math.abs((backrestMax - backrestMin)) * percentPerTrigger // Delta: Decrease value for 0.001% of the value span with each timer trigger
                if((backrestAngle - normalizedDelta) < backrestMin)
                    backrestAngle = backrestMin
                else
                    backrestAngle -= normalizedDelta
                break
            case 3: // Seat
                normalizedDelta = Math.abs((seatMax - seatMin)) * percentPerTrigger // Delta: Decrease value for 0.001% of the value span with each timer trigger
                if((seatHardness - normalizedDelta) < seatMin)
                    seatHardness = seatMin
                else
                    seatHardness -= normalizedDelta
                break
            case 4: // Footrest
                normalizedDelta = Math.abs((footrestMax - footrestMin)) * percentPerTrigger // Delta: Decrease value for 0.001% of the value span with each timer trigger
                if((footrestAngle - normalizedDelta) < footrestMin)
                    footrestAngle = footrestMin
                else
                    footrestAngle -= normalizedDelta
                break
            case 0: // None
            default:
                break
            }
        }

    }
}
