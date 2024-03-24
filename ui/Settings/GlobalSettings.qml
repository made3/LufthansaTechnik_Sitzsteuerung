import QtQuick 2.0

Item {
    property real headrestHeight: 20
    property real headrestMin: 0 // degree
    property real headrestMax: 75 // degree

    property real backrestAngle: 90
    property real backrestMin: 0 // mm
    property real backrestMax: 90 // mm

    property real seatHardness: 0
    property real seatMin: 0 // percent
    property real seatMax: 100 // percent

    property real footrestAngle: 0
    property real footrestMin: 0 // degree
    property real footrestMax: 90 // degree


    enum SeatPart {
        None,
        Headrest,
        Backrest,
        Seat,
        Footrest
    }

    property int selectedPart: GlobalSettings.SeatPart.None


    function headrestToPercent(currentHeight){
        return (currentHeight - globalSettings.headrestMin) / (globalSettings.headrestMax - globalSettings.headrestMin)
    }
}
