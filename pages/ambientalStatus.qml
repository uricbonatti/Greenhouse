import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12


ScrollablePage{
    id: pageStatusId

    Material.foreground: "white"
    Column{

        spacing: 10
        width: parent.width

        Rectangle{
            width: parent.width
            height: 80
            border.color: "#41cd52"
            border.width: 1
            color: "transparent"
            radius: 15
            Rectangle{
                width: parent.height
                height: width
                color: "#41cd52"
                radius: 15
                ToolButton {
                    icon.source: "../images/tempInside.png"
                    anchors.centerIn: parent
                    height: parent.height/2
                    width: parent.width/2
                }
            }
            Rectangle{
                width: parent.width-parent.height
                height: parent.height/2
                anchors.top: parent.top
                anchors.right: parent.right
                color: "transparent"
                Text{
                    anchors.centerIn: parent
                    text: "Temperatura Interna"
                    font.pixelSize: 15
                    color: "green"
                }
            }
            Rectangle{
                width: parent.width-parent.height
                height: parent.height/2
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                color: "transparent"
                Text{
                    id: tempInTextId
                    anchors.centerIn: parent
                    text:  settings.setupTemp + "ºC"
                    font.pixelSize: 15
                    color: "green"
                }
            }
        }
        Rectangle{
            width: parent.width
            height: 80
            border.color: "#41cd52"
            border.width: 1
            color: "transparent"
            radius: 15
            Rectangle{
                width: parent.height
                height: width
                color: "#41cd52"
                radius: 15
                ToolButton {
                    icon.source: "../images/tempOutside.png"
                    anchors.centerIn: parent
                    height: parent.height/2
                    width: parent.width/2
                }
            }
            Rectangle{
                width: parent.width-parent.height
                height: parent.height/2
                anchors.top: parent.top
                anchors.right: parent.right
                color: "transparent"
                Text{
                    anchors.centerIn: parent
                    text: "Temperatura Externa"
                    font.pixelSize: 15
                    color: "green"
                }
            }
            Rectangle{
                width: parent.width-parent.height
                height: parent.height/2
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                color: "transparent"
                Text{
                    id: tempOutTextId
                    anchors.centerIn: parent
                    text: "ºC"
                    font.pixelSize: 15
                    color: "green"
                }

            }
        }
        Rectangle{
            width: parent.width
            height: 80
            border.color: "#41cd52"
            border.width: 1
            color: "transparent"
            radius: 15
            Rectangle{
                width: parent.height
                height: width
                color: "#41cd52"
                radius: 15
                ToolButton {
                    icon.source: "../images/umdAr.png"
                    anchors.centerIn: parent
                    height: parent.height/2
                    width: parent.width/2
                }
            }
            Rectangle{
                width: parent.width-parent.height
                height: parent.height/2
                anchors.top: parent.top
                anchors.right: parent.right
                color: "transparent"
                Text{
                    anchors.centerIn: parent
                    text: "Umidade do Ar"
                    font.pixelSize: 15
                    color: "green"
                }
            }
            Rectangle{
                width: parent.width-parent.height
                height: parent.height/2
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                color: "transparent"
                Text{
                    id: umdArTextId
                    anchors.centerIn: parent
                    text: settings.setupUmdAr+"%"
                    font.pixelSize: 15
                    color: "green"
                }
            }
        }
        Rectangle{
            width: parent.width
            height: 80
            border.color: "#41cd52"
            border.width: 1
            color: "transparent"
            radius: 15
            Rectangle{
                width: parent.height
                height: width
                color: "#41cd52"
                radius: 15
                ToolButton {
                    icon.source: "../images/umdSolo.png"
                    anchors.centerIn: parent
                    height: parent.height/2
                    width: parent.width/2
                }
            }
            Rectangle{
                width: parent.width-parent.height
                height: parent.height/2
                anchors.top: parent.top
                anchors.right: parent.right
                color: "transparent"
                Text{
                    anchors.centerIn: parent
                    text: "Umidade do Solo"
                    font.pixelSize: 15
                    color: "green"
                }
            }
            Rectangle{
                width: parent.width-parent.height
                height: parent.height/2
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                color: "transparent"
                Text{
                    id: umdSoloTextId
                    anchors.centerIn: parent
                    text: settings.setupUmdSolo+"%"
                    font.pixelSize: 15
                    color: "green"
                }
            }
        }
        Rectangle{
            width: parent.width
            height: 80
            border.color: "#41cd52"
            border.width: 1
            color: "transparent"
            radius: 15
            Rectangle{
                width: parent.height
                height: width
                color: "#41cd52"
                radius: 15
                ToolButton {
                    icon.source: "../images/waterTank.png"
                    anchors.centerIn: parent
                    height: parent.height/2
                    width: parent.width/2
                }
            }
            Rectangle{
                width: parent.width-parent.height
                height: parent.height/2
                anchors.top: parent.top
                anchors.right: parent.right
                color: "transparent"
                Text{
                    anchors.centerIn: parent
                    text: "Volume do Reservatorio de Agua"
                    font.pixelSize: 15
                    color: "green"
                }
            }
            Rectangle{
                width: parent.width-parent.height
                height: parent.height/2
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                color: "transparent"
                Text{
                    id: waterTankTextId
                    anchors.centerIn: parent
                    text: "ºC"
                    font.pixelSize: 15
                    color: "green"
                }
            }
        }
        Rectangle{
            width: parent.width
            height: 80
            border.color: "#41cd52"
            border.width: 1
            color: "transparent"
            radius: 15
            Rectangle{
                width: parent.height
                height: width
                color: "#41cd52"
                radius: 15
                ToolButton {
                    icon.source: "../images/light.png"
                    anchors.centerIn: parent
                    height: parent.height/2
                    width: parent.width/2
                }
            }
            Rectangle{
                width: parent.width-parent.height
                height: parent.height/2
                anchors.top: parent.top
                anchors.right: parent.right
                color: "transparent"
                Text{
                    anchors.centerIn: parent
                    text: "Iluminação"
                    font.pixelSize: 15
                    color: "green"
                }
            }
            Rectangle{
                width: parent.width-parent.height
                height: parent.height/2
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                color: "transparent"
                Text{
                    id: lightTextId
                    anchors.centerIn: parent
                    text: settings.onLight===true ?"ON" : "OFF"
                    font.pixelSize: 15
                    color: "green"
                }
            }
        }
        Rectangle{
            width: parent.width
            height: 80
            border.color: "#41cd52"
            border.width: 1
            color: "transparent"
            radius: 15
            Rectangle{
                width: parent.height
                height: width
                color: "#41cd52"
                radius: 15
                ToolButton {
                    icon.source: "../images/cooler.png"
                    anchors.centerIn: parent
                    height: parent.height/2
                    width: parent.width/2
                }
            }
            Rectangle{
                width: parent.width-parent.height
                height: parent.height/2
                anchors.top: parent.top
                anchors.right: parent.right
                color: "transparent"
                Text{
                    anchors.centerIn: parent
                    text: "Ventilação"
                    font.pixelSize: 15
                    color: "green"
                }
            }
            Rectangle{
                width: parent.width-parent.height
                height: parent.height/2
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                color: "transparent"
                Text{
                    id: coolerTextId
                    anchors.centerIn: parent
                    text: settings.onCooler===true ?"ON" : "OFF"
                    font.pixelSize: 15
                    color: "green"
                }
            }
        }
        Rectangle{
            width: parent.width
            height: 80
            border.color: "#41cd52"
            border.width: 1
            color: "transparent"
            radius: 15
            Rectangle{
                width: parent.height
                height: width
                color: "#41cd52"
                radius: 15
                ToolButton {
                    icon.source: "../images/cold.png"
                    anchors.centerIn: parent
                    height: parent.height/2
                    width: parent.width/2
                }
            }
            Rectangle{
                width: parent.width-parent.height
                height: parent.height/2
                anchors.top: parent.top
                anchors.right: parent.right
                color: "transparent"
                Text{
                    anchors.centerIn: parent
                    text: "Refrigeração"
                    font.pixelSize: 15
                    color: "green"
                }
            }
            Rectangle{
                width: parent.width-parent.height
                height: parent.height/2
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                color: "transparent"
                Text{
                    id: peltier1TextId
                    anchors.centerIn: parent
                    text: settings.onPeltier1===true ?"ON" : "OFF"
                    font.pixelSize: 15
                    color: "green"
                }
            }
        }
        Rectangle{
            width: parent.width
            height: 80
            border.color: "#41cd52"
            border.width: 1
            color: "transparent"
            radius: 15
            Rectangle{
                width: parent.height
                height: width
                color: "#41cd52"
                radius: 15
                ToolButton {
                    icon.source: "../images/hot.png"
                    anchors.centerIn: parent
                    height: parent.height/2
                    width: parent.width/2
                }
            }
            Rectangle{
                width: parent.width-parent.height
                height: parent.height/2
                anchors.top: parent.top
                anchors.right: parent.right
                color: "transparent"
                Text{
                    anchors.centerIn: parent
                    text: "Aquecimento"
                    font.pixelSize: 15
                    color: "green"
                }
            }
            Rectangle{
                width: parent.width-parent.height
                height: parent.height/2
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                color: "transparent"
                Text{
                    id: peltier2TextId
                    anchors.centerIn: parent
                    text: settings.onPeltier2===true ?"ON" : "OFF"
                    font.pixelSize: 15
                    color: "green"
                }
            }
        }
    }
}


