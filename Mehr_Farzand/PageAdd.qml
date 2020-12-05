import QtQuick 2.12
import QtQuick.Controls 2.12
import QtPositioning 5.12
import POST_REQ 1.0


Pane {
    id: pane

    property string lat
    property string lon
    property date currentTime: new Date()
    property string timeString
    property string fnameString
    property string lnameString
    property string addrString
    property string contacString

    POST_REQ {
        id: demo
    }



    PositionSource {
        id: src
        updateInterval: 1000
        active: true

        onPositionChanged: {
            var coord = src.position.coordinate;
            console.log("Coordinate:", coord.latitude,coord.longitude );
            lat=coord.latitude;
            lon=coord.longitude;
        }
    }

    SwipeView {
        id: view
        currentIndex: 0
        anchors.fill: parent

        Item{
            id:firstElement
            Pane {
                width: view.width
                height: view.height

                Column {
                    spacing: 40
                    width: parent.width

                    Label {
                        text: "Name"
                        anchors.verticalCenter: parent.verticalCenter
                        color: "black"
                        anchors.left: parent.left
                    }
                    TextField {
                        id:fName
                        x: .3*parent.width
                        width: .65*parent.width
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                Column {
                    y: 50
                    spacing: 40
                    width: parent.width

                    Label {
                        text: "Surname"
                        anchors.verticalCenter: parent.verticalCenter
                        color: "black"
                        anchors.left: parent.left
                    }
                    TextField {
                        id:lName
                        x: .3*parent.width
                        anchors.verticalCenter: parent.verticalCenter
                        width: .65*parent.width
                    }
                }
            }
        }

        Item{
            id:secondElement
            Pane {
                width: view.width
                height: view.height

                Column {
                    spacing: 40
                    width: parent.width

                    Label {
                        text: "Address"
                        anchors.verticalCenter: parent.verticalCenter
                        color: "black"
                        anchors.left: parent.left
                    }
                    TextField {
                        id:addr1
                        x: .3*parent.width
                        width: .65*parent.width
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                Column {
                    y: 50
                    spacing: 40
                    width: parent.width

                    Label {

                        text: "Phone number"
                        anchors.verticalCenter: parent.verticalCenter
                        color: "black"
                        anchors.left: parent.left
                    }
                    TextField {
                        id:phNumber
                        x: .3*parent.width
                        anchors.verticalCenter: parent.verticalCenter
                        width: .65*parent.width
                    }
                }
                Column {
                    y: 100
                    spacing: 40
                    width: parent.width

                    Label {

                        text: "Latitude"
                        anchors.verticalCenter: parent.verticalCenter
                        color: "black"
                        anchors.left: parent.left
                    }
                    TextField {
                        id: latAdd
                        x: .3*parent.width
                        anchors.verticalCenter: parent.verticalCenter
                        width: .65*parent.width
                    }
                }
                Column {
                    y: 150
                    spacing: 40
                    width: parent.width

                    Label {

                        text: "Longtitude"
                        anchors.verticalCenter: parent.verticalCenter
                        color: "black"
                        anchors.left: parent.left
                    }
                    TextField {
                        id: longAdd
                        x: .3*parent.width
                        anchors.verticalCenter: parent.verticalCenter
                        width: .65*parent.width
                    }
                }
            }
        }

        Item{
            id:thirdElement
            Pane {
                width: view.width
                height: view.height

                Column {
                    y: 50
                    spacing: 15
                    width: parent.width

                    Button {
                        id: sendButton
                        x: parent.width/2
                        text: "Save to the database"
                        visible : true
                        enabled: true

                        onClicked:
                        {
                            timeString = currentTime.toLocaleString(locale,"yyyy-MM-dd");//  Locale.ShortFormat);
                            fnameString = fName.text
                            lnameString = lName.text
                            addrString = addr1.text
                            contacString = phNumber.text


                            demo.upload(fnameString, lnameString,timeString,addrString,contacString,lat,lon)
                            console.log(lat,lon,timeString);
                        }
                    }
                }
            }
        }
    }

    PageIndicator {
        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
