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




//    Rectangle{
//        id: seat
//        width: (parent.width - controls.height ) / 2
//        height: (parent.width - controls.height) / 1.5

//        anchors{
//            top: controls.bottom

//        }

//        anchors.centerIn: parent

//        color: "blue"
//    }



//    Image{
//        id: seatImage
//        source: "qrc:/ui/assets/seatTotal.png"

//        width: parent.width / 1.75
//        anchors.centerIn: parent

//        fillMode: Image.PreserveAspectFit


//        transform: Rotation { origin.x: seatImage.width / 2; origin.y: seatImage.height / 2; angle: counter}

////        states: State {
////            name: "rotated"
////            PropertyChanges { target: seatImage; rotation: 350 }
////        }

////        transitions: Transition {
////            RotationAnimation { duration: 200; direction: RotationAnimation.Counterclockwise }
////        }

//    }

//    Timer{
//        id: increaseTimer
//        interval: 10
//        running: false
//        repeat: true

//        onTriggered: counter += 0.1
//    }
//    Timer{
//        id: decreaseTimer
//        interval: 10
//        running: false
//        repeat: true

//        onTriggered: counter -= 0.1
//    }

//    Rectangle{
//        id: controls
//        height: parent.width / 8
//        width:  3 * (parent.width / 8)

//        anchors{
//            top: parent.top

//            horizontalCenter: parent.horizontalCenter
//        }
//        color: "blue"

//        Rectangle{
//            height: parent.height
//            width: parent.height

//            anchors{
//                top: parent.top
//                left: parent.left
//                bottom: parent.bottom
//            }

//            color: "yellow"

//            MouseArea{
//                anchors.fill: parent

//                onPressed: increaseTimer.start()
//                onReleased: increaseTimer.stop()
//            }
//        }


//        Rectangle{
//            height: parent.height
//            width: parent.height

//            anchors{
//                top: parent.top
//                right: parent.right
//                bottom: parent.bottom
//            }

//            color: "red"

//            MouseArea{
//                anchors.fill: parent

//                onPressed: decreaseTimer.start()
//                onReleased: decreaseTimer.stop()
//            }
//        }

//    }
}
