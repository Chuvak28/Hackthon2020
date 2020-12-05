import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Universal 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Qt.labs.settings 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4


ApplicationWindow {
    id: appWindowId
    visible: true
    width: 360
    height: 520
    title: qsTr("Mehr Farzand")

    color: "red"

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

        Material.foreground: "white"
        RowLayout {
            anchors.fill: parent

            ToolButton {
                icon.source:  "icons/gallery/20x20/drawer.png"
                onClicked: drawerId.open()
            }
            Label {
                id: titleLabel
                anchors.centerIn: parent
                text: "Mehr Farzand"
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
                ListElement { title: "Graph"; source: "qrc:/PageGraph.qml" }
                ListElement { title: "Chat"; source: "qrc:/PageGraph.qml" }


            }

            ScrollIndicator.vertical: ScrollIndicator { }
        }


    }

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: Pane {
            id: pane


            Label {
                text: "Мы вас любим папа и мама"
                anchors.margins: 20
                anchors.top: logo.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: arrow.top
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
                wrapMode: Label.Wrap
            }


        }
    }
}
