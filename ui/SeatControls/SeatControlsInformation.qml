import QtQuick 2.0

Rectangle {
    color: "transparent"

    Text{
        id: controlType
        text:{
            switch(globalSettings.selectedPart){
            case 1: // Headrest
                "HEADREST"
                break
            case 2: // Backrest
                "BACKREST"
                break
            case 3: // Seat
                "HARDNESS"
                break
            case 4: // Footrest
                "FOOTREST"
                break
            case 0: // None
            default:
                "SELECT\nSEATPART"
                break
            }
        }

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        fontSizeMode: Text.Fit
        minimumPixelSize: 4

        font{
            family: "MS UI Gothic"
            pointSize: 72
        }


        color: "white"

        height: parent.height * 0.3

        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }

    Text{
        id: controlValue
        text:{
            switch(globalSettings.selectedPart){
            case 1: // Headrest
                Math.abs(Math.round(globalSettings.headrestHeight)) // Round to get natural number and take absolute value because positive value is better to read
                break
            case 2: // Backrest
                Math.abs(Math.round(globalSettings.backrestAngle)) // Round to get natural number and take absolute value because positive value is better to read
                break
            case 3: // Seat
                Math.abs(Math.round(globalSettings.seatHardness)) // Round to get natural number and take absolute value because positive value is better to read
                break
            case 4: // Footrest
                Math.abs(Math.round(globalSettings.footrestAngle)) // Round to get natural number and take absolute value because positive value is better to read
                break
            case 0: // None
            default:
                ""
                break
            }
        }
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        fontSizeMode: Text.Fit
        minimumPixelSize: 4

        font{
            family: "MS UI Gothic"
            pointSize: 72
        }

        color: "white"

        height: parent.height * 0.7

        anchors{
            top: controlType.bottom
            left: parent.left
            right: parent.right
        }
    }

}
