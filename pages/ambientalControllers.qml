import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Styles 1.4
import Qt.labs.settings 1.1




ScrollablePage{
    id: pageControllersId

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
            Text{
                id: st1Id
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.margins: 10
                text: "Temperatura Interna"
                font.pixelSize: 15
                color: "green"
            }
            Text{
                id: st2Id
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.margins: 10
                text: "15ºC"
                font.pixelSize: 15
                color: "green"
            }
            Text{
                id: st3Id
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.margins: 10
                text: "35ºC"
                font.pixelSize: 15
                color: "green"
            }

            Slider {
                id: tempSliderId
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: st3Id.left
                anchors.left: st2Id.right

                stepSize: 1
                from: 15
                to: 35
                value: settings.setupTemp
            }
            Text{
                id: tempValueId
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.margins: 10
                text: tempSliderId.value +"ºC"
                font.pixelSize: 15
                color: "green"
            }
        }
        Rectangle{
            width: parent.width
            height: 80
            border.color: "#41cd52"
            border.width: 1
            color: "transparent"
            radius: 15
            Text{
                id: st4Id
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.margins: 10
                text: "Umidade do Ar"
                font.pixelSize: 15
                color: "green"
            }
            Text{
                id: st5Id
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.margins: 10
                text: "10%"
                font.pixelSize: 15
                color: "green"
            }
            Text{
                id: st6Id
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.margins: 10
                text: "90%"
                font.pixelSize: 15
                color: "green"
            }

            Slider {
                id: umdArSliderId
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: st6Id.left
                anchors.left: st5Id.right
                from: 10
                to: 90
                stepSize: 1
                value: settings.setupUmdAr
            }
            Text{
                id: umdArValueId
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.margins: 10
                text: umdArSliderId.value +"%"
                font.pixelSize: 15
                color: "green"
            }
        }
        Rectangle{
            width: parent.width
            height: 80
            border.color: "#41cd52"
            border.width: 1
            color: "transparent"
            radius: 15
            Text{
                id: st7Id
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.margins: 10
                text: "Umidade do Solo"
                font.pixelSize: 15
                color: "green"
            }
            Text{
                id: st8Id
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.margins: 10
                text: "10%"
                font.pixelSize: 15
                color: "green"
            }
            Text{
                id: st9Id
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.margins: 10
                text: "90%"
                font.pixelSize: 15
                color: "green"
            }

            Slider {
                id: umdSoloSliderId
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: st9Id.left
                anchors.left: st8Id.right
                stepSize: 1
                from: 10
                to: 90
                value: settings.setupUmdSolo
            }
            Text{
                id: umdSoloValueId
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.margins: 10
                text: umdSoloSliderId.value +"%"
                font.pixelSize: 15
                color: "green"
            }

        }
        Rectangle{
            width: parent.width
            height: 80
            border.color: "#41cd52"
            border.width: 1
            color: "transparent"
            radius: 15
            Text{
                id: temporaryId
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.margins: 10
                text: "Luz, Cooler e Peltiers"
                font.pixelSize: 15
                color: "green"
            }
            Slider {
                id: temporarySliderId
                anchors.centerIn: parent
                stepSize: 1
                from: 0
                to: 1
                value: settings.onLight? 1 : 0
            }
        }
    }
    Component.onDestruction: {
        settings.setupUmdAr = umdArSliderId.value
        settings.setupUmdSolo = umdSoloSliderId.value
        settings.setupTemp = tempSliderId.value
        settings.onLight = temporarySliderId.value===1?true : false
        settings.onCooler = temporarySliderId.value===1?true : false
        settings.onPeltier1 = temporarySliderId.value===1?true : false
        settings.onPeltier2 = temporarySliderId.value===1?true : false
    }
}
