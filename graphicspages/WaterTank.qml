import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.4
import QtCharts 2.3
import "dbToChart.js" as JS

Pane {
    id: waterTankPageId
    rotation: 90
    ChartView {
        id: waterTankChartId
        title: "Nivel do Reservatorio ao Longo do Tempo"
        width: waterTankPageId.height*7/8
        height: waterTankPageId.width*7/8
        anchors.centerIn: parent
        backgroundColor: "transparent"
        antialiasing: true
        LineSeries{
            name: "Agua(%)"
            color: "red"
            id:waterTankSeries
            axisX: DateTimeAxis {
                id:waterTankaxisX
                format: "hh:mm"
                tickCount: 6
            }
            axisY: ValueAxis {
                id:waterTankaxisY
                min: 0
                max: 100
            }
        }
    }

}
