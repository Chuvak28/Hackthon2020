import QtQuick 2.0
import QtCharts 2.3
import QtQuick.Controls 2.12

Page {
    id: page1
    SwipeView {
        id: view
        currentIndex: 0
        anchors.fill: parent

        Item{
            id:thirdElement
            Pane {
                width: view.width
                height: view.height

                Column {
                    y: 50
                    spacing: 15
                    width: parent.width

                    ChartView {
                        title: "Line"
                        anchors.fill: parent
                        antialiasing: true

                        LineSeries {
                            name: "LineSeries"
                            XYPoint { x: 0; y: 0 }
                            XYPoint { x: 1.1; y: 2.1 }
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
