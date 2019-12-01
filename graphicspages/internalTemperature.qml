import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.4
import QtCharts 2.3
import "dbToChart.js" as JS

Pane {
    id: internalTemperaturePageId
    rotation: 90
    ChartView {
        id: internalTemperatureChartId
        title: "Temperatura Interna ao Longo do Tempo"
        width: internalTemperaturePageId.height*7/8
        height: internalTemperaturePageId.width*7/8
        anchors.centerIn: parent
        backgroundColor: "transparent"
        antialiasing: true
        LineSeries{
            name: "Temperatura(ºC)"
            color: "red"
            id:iTempSeries
            axisX: DateTimeAxis {
                id:iTempaxisX
                format: "hh:mm"
                tickCount: 6
            }
            axisY: ValueAxis {
                id:iTempaxisY
                min: 0
                max: 50
            }
        }
    }
/*    Component.onCompleted: {
        JS.iTempOnChart()
    }*/
}
