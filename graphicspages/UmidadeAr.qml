import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.4
import QtCharts 2.3
import "dbToChart.js" as JS

Pane {
    id: umdAirPageId
    rotation: 90
    ChartView {
        id: umdAirChartId
        title: "Umidade do Ar ao Longo do Tempo"
        width: umdAirPageId.height*7/8
        height: umdAirPageId.width*7/8
        anchors.centerIn: parent
        backgroundColor: "transparent"
        antialiasing: true
        LineSeries{
            name: "Umidade (%)"
            color: "red"
            id:umdAirSeries
            axisX: DateTimeAxis {
                id:umdAiraxisX
                format: "hh:mm"
                tickCount: 6
            }
            axisY: ValueAxis {
                id:umdAiraxisY
                min: 0
                max: 100
            }
        }
    }
   /* Component.onCompleted: {
        JS.umdAirOnChart()
    }*/
}
