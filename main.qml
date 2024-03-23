import QtQuick 2.12
import QtQuick.Window 2.12
import "ui/Seat"
import "ui/SeatControls"
import "ui/SeatSaves"

Window {
    id: mainWindow
    visible: true
    width: 640
    height: 960
    title: qsTr("Sitzsteuerung")

    color: mainWindow.backgroundColor


//    property real counter: 0

    property real heightRatio: height / 10
    property color backgroundColor: "#151a24"




//    property real headrestHeight: 100
//    property real headrestMin: 20 // mm
//    property real headrestMax: 100 // mm

//    property real backrestAngle: -75
//    property real backrestMin: -75 // degree
//    property real backrestMax: 0 // degree

//    property real seatHardness: 0
//    property real seatMin: 0 // percent
//    property real seatMax: 100 // percent

//    property real footrestAngle: 0
//    property real footrestMin: 0 // degree
//    property real footrestMax: 90 // degree


    property real headrestHeight: 20
    property real headrestMin: 20 // mm
    property real headrestMax: 100 // mm

    property real backrestAngle: 0
    property real backrestMin: -75 // degree
    property real backrestMax: 0 // degree

    property real seatHardness: 0
    property real seatMin: 0 // percent
    property real seatMax: 100 // percent

    property real footrestAngle: 90
    property real footrestMin: 0 // degree
    property real footrestMax: 90 // degree

    function headrestToPercent(){
        return (headrestHeight - headrestMin) / (headrestMax - headrestMin)
    }



    SeatSaves{
        id: seatSaves
    }

    Seat{
        id: seat
    }

    SeatControls{
        id: seatControls
    }


}
