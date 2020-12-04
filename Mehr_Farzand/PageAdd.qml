import QtQuick 2.12
import QtQuick.Controls 2.12

SwipeView {
    id: view
    currentIndex: 1
    anchors.fill: parent

    Repeater {
        model: 3

        Pane {
            width: view.width
            height: view.height

            Column {
                spacing: 40
                width: parent.width

                Button {
                    id: cpatureButton

                    opacity: 0.5

                    Text {
                        id: textId
                        text: qsTr("Take Photo")
                        color: "white"
                    }
                    onClicked: {
                        camera.imageCapture.capture();
                        cpatureButton.enabled=false
                        textId.visible=false
                        sendButton.visible = true
                        sendButton.enabled = true
                        complainText.visible = true


                    }
                }

                Button {
                    id: sendButton

                    text: "Send"
                    visible : false
                    enabled: false



                    onClicked:
                    {
                        timeString = currentTime.toLocaleString(locale,"yyyy-MM-dd hh:mm:ss");//  Locale.ShortFormat);
                        textString = complainText.text
                        demo.upload(lat,lon, timeString,textString, photoString)
                        console.log(lat,lon,timeString, textString, photoString);
                    }
                }

                TextField {
                    id: complainText

                    x: parent.width/2
                    y: parent.bottom
                    visible : false
                    width: 160
                    placeholderText: "Enter Text Here"
                    focus: true
                    color: "#aaa"
                }

            }
        }
    }
}

//PageIndicator {
//    count: view.count
//    currentIndex: view.currentIndex
//    anchors.bottom: parent.bottom
//    anchors.horizontalCenter: parent.horizontalCenter
//}


