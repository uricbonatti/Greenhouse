import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.4
import QtCharts 2.3
import "dbToChart.js" as JS

Pane {
    id: umdEarthPageId
    rotation: 90
    ChartView {
        id: umdEarthChartId
        title: "Umidade do Solo ao Longo do Tempo"
        width: umdEarthPageId.height*7/8
        height: umdEarthPageId.width*7/8
        anchors.centerIn: parent
        backgroundColor: "transparent"
        antialiasing: true
        LineSeries{
            name: "Umidade(%)"
            color: "red"
            id:umdEarthSeries
            axisX: DateTimeAxis {
                id:umdEarthaxisX
                format: "hh:mm"
                tickCount: 6
            }
            axisY: ValueAxis {
                id:umdEarthaxisY
                min: 0
                max: 100
            }
        }
    }

}
