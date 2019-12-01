import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtCharts 2.3
import "dbToChart.js" as JS

Page {
    id: pane

    SwipeView {
        id: view
        anchors.fill: parent
        currentIndex: pageIndicatorId1.currentIndex
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

        }
    }

    PageIndicator {
        id: pageIndicatorId1
        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        interactive: true
    }
    Component.onCompleted: {
        JS.allCharts()
    }
}
