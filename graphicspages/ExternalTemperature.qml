import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.4
import QtCharts 2.3
import "dbToChart.js" as JS

Pane {
    id: externalTemperaturePageId
    rotation: 90
    ChartView {
        id: externalTemperatureChartId
        title: "Temperatura Externa ao Longo do Tempo"
        width: externalTemperaturePageId.height*7/8
        height: externalTemperaturePageId.width*7/8
        anchors.centerIn: parent
        backgroundColor: "transparent"
        antialiasing: true
        LineSeries{
            name: "Temperatura(ºC)"
            color: "red"
            id:eTempSeries
            axisX: DateTimeAxis {
                id:eTempaxisX
                format: "hh:mm"
                tickCount: 6
            }
            axisY: ValueAxis {
                id:eTempaxisY
                min: 0
                max: 50
            }
        }
    }
}
