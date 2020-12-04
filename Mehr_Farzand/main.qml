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

    color: "beige"

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
            //            Label {
            //                id: titleLabel
            //                text: "Mehr Farzand"
            //                font.pixelSize: 20
            //                elide: Label.ElideRight
            //                horizontalAlignment: Qt.AlignHCenter
            //                verticalAlignment: Qt.AlignVCenter
            //                Layout.fillWidth: true
            //            }
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
                    drawer.close()
                }
            }

            model: ListModel {
                ListElement { title: "Add"; source: "qrc:/PageAdd.qml" }


            }

            ScrollIndicator.vertical: ScrollIndicator { }
        }


    }
}
