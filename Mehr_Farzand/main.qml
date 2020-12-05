import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Universal 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Qt.labs.settings 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import POST_REQ 1.0

ApplicationWindow {
    id: appWindowId
    visible: true
    width: 360
    height: 520
    title: qsTr("Mehribon Farzandlar")

    Shortcut {
        sequences: ["Esc", "Back"]
        enabled: stackView.depth > 1
        onActivated: navigateBackAction.trigger()
    }

    Action {
        id: navigateBackAction
        icon.name: stackView.depth > 1 ? "back" : "drawer"
        onTriggered: {
            if (stackView.depth > 1) {
                stackView.pop()
                listView.currentIndex = -1
            } else {
                drawerId.open()
            }
        }
    }

    header: ToolBar{

        Material.foreground: "blue"
        RowLayout {
            anchors.fill: parent

            ToolButton {
                icon.source:  "icons/gallery/20x20/drawer.png"
                onClicked: drawerId.open()
            }
            Label {
                id: titleLabel
                anchors.centerIn: parent
                text: "Mehribon Farzandlar"
            }

        }
    }

    Drawer{
        id: drawerId

        width: Math.min(appWindowId.width, appWindowId.height)/3*2
        height: parent.height
        interactive: stackView.depth === 1

        ListView {
            id: listView

            focus: true
            currentIndex: -1
            anchors.fill: parent

            delegate: ItemDelegate {
                width: parent.width
                text: model.title
                highlighted: ListView.isCurrentItem
                onClicked: {
                    listView.currentIndex = index
                    stackView.push(model.source)
                    drawerId.close()
                }
            }

            model: ListModel {
                ListElement { title: "Add"; source: "qrc:/PageAdd.qml" }
                //ListElement { title: "Graph"; source: "qrc:/PageGraph.qml" }
                ListElement { title: "Chat"; source: "qrc:/PageGraph.qml" }
                ListElement { text: qsTr("About...")
                    triggered: function(){ aboutDialog.open(); }
                }
                //ScrollIndicator.vertical: ScrollIndicator { }
            }
        }


    }
    StackView {
        id: stackView
        anchors.fill: parent

        //        initialItem: Pane {
        //            id: pane
        Flickable{
            width: parent.width
            height: parent.height
            contentHeight: gridLayoutID.implicitHeight + 100
            GridLayout
            {
                id: gridLayoutID
                columns: 2
                anchors.centerIn: parent
                columnSpacing: 100

                Button {
                    id: cpatureButton
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    opacity: 0.5

                    Text {
                        id: textId
                        text: qsTr("Cameras")
                        color: "black"
                        anchors.centerIn: parent
                    }
                    onClicked: {
                        stackView.push("Cameras.qml")
                    }

                    background: Rectangle {
                        color: "#00c0f5"
                        implicitWidth: 150
                        implicitHeight: 150
                        border.color: control.down ? "#17a81a" : "#21be2b"
                        border.width: 1
                        radius: 14
                    }
                }

                Button {
                    id: sensorsButton
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    opacity: 0.5

                    Text {
                        id: sensorsId
                        text: qsTr("Sensors")
                        color: "black"
                        anchors.centerIn: parent
                    }
                    onClicked: {

                    }

                    background: Rectangle {
                        color: "#00c0f5"
                        implicitWidth: 150
                        implicitHeight: 150
                        border.color: control.down ? "#17a81a" : "#21be2b"
                        border.width: 1
                        radius: 14
                    }
                }
            }
        }
    }
    Dialog {
        id: aboutDialog
        title: qsTr("About")
        Label {
            anchors.fill: parent
            text: qsTr("QML Image Viewer\nA part of the QmlBook\nhttp://qmlbook.org")
            horizontalAlignment: Text.AlignHCenter
        }

        standardButtons: StandardButton.Ok
    }
}
