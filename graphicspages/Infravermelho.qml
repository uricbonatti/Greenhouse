import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.4
import QtCharts 2.3
import "dbToChart.js" as JS

Pane {
    id: infraredPageId
    rotation: 90
    ChartView {
        id: infraredChartId
        title: "Taxa de Infravermelho ao Longo do Tempo"
        width: infraredPageId.height*7/8
        height: infraredPageId.width*7/8
        anchors.centerIn: parent
        backgroundColor: "transparent"
        antialiasing: true
        LineSeries{
            name: "Infravermelho (%)"
            color: "red"
            id:irrLevelSeries
            axisX: DateTimeAxis {
                id:irrLevelaxisX
                format: "hh:mm"
                tickCount: 6
            }
            axisY: ValueAxis {
                id:irrLevelaxisY
                min: 0
                max: 100
            }
        }
    }
    /*Component.onCompleted: {
        JS.infraredOnChart()
    }*/
}
