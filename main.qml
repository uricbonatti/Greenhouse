import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Universal 2.12
import Qt.labs.settings 1.1
import QtQuick.LocalStorage 2.12
import QtCharts 2.3
import "dbControl.js" as JS


ApplicationWindow {
    id: window
    visible: true
    width: 360
    height: 520
    title: qsTr("GreenHouse Control")
    property var db;
    property string any

    Settings {
        id: settings
        property string style: "Material"
        property int setupTemp: 0
        property int setupUmdAr: 0
        property int setupUmdSolo: 0
        property int readIntTemp: 0
        property int readExtTemp: 0
        property int readUmdAr: 0
        property int readUmdSolo: 0
        property int readIRR: 0
        property int readWaterTank: 0
        property bool onLight: true
        property bool onCooler: false
        property bool onPeltier1: true
        property bool onPeltier2: true
        property string lastIP: "127.0.0.1"


    }
    property var dbRead: ListModel{
                id: readingsModelId
            }


    Shortcut {
        sequences: ["Esc", "Back"]
        enabled: stackView.depth > 1
        onActivated: {
            stackView.pop()
            listView.currentIndex = -1
        }
    }

    Shortcut {
        sequence: "Menu"
        onActivated: optionsMenu.open()
    }

    header: ToolBar {
        Material.foreground: "white"

        RowLayout {
            spacing: 20
            anchors.fill: parent
            ToolButton {
                icon.source: stackView.depth > 1 ? "images/back.png" : "images/drawer.png"
                onClicked: {
                    if (stackView.depth > 1) {
                        stackView.pop()
                        listView.currentIndex = -1
                    } else {
                        drawer.open()
                    }
                }
            }

            Label {
                id: titleLabel
                text: listView.currentItem ? listView.currentItem.text : "Estufa Agora"
                font.pixelSize: 20
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            ToolButton {
                icon.source: "images/menu.png"
                onClicked: optionsMenu.open()
                Menu {
                    id: optionsMenu
                    x: parent.width - width
                    transformOrigin: Menu.TopRight

                    MenuItem {
                        text: "Configurações"
                        onTriggered: settingsDialog.open()
                    }
                    MenuItem {
                        text: "Sobre"
                        onTriggered: aboutDialog.open()
                    }
                }
            }
        }
    }

    Drawer {
        id: drawer
        width: Math.min(window.width, window.height) / 3 * 2
        height: window.height
        interactive: stackView.depth === 1

        ListView {
            id: listView

            focus: true
            currentIndex: -1
            anchors.fill: parent

            delegate: ItemDelegate {
                width: parent.width
                text: model.title
                highlighted: ListView.isCurrentItem
                onClicked: {
                    listView.currentIndex = index
                    stackView.push(model.source)
                    drawer.close()
                }
            }

            model: ListModel {
                ListElement { title: "Status"; source: "qrc:/pages/ambientalStatus.qml" }
                ListElement { title: "Controles"; source: "qrc:/pages/ambientalControllers.qml" }
                ListElement { title: "Graficos"; source: /*"qrc:/graphicspages/SwipeViewPage.qml"*/ "qrc:/graphicspages/Charts.qml" }
            }

            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: Pane {
            id: pane

            Image {
                id: logo
                width: pane.availableWidth/2
                height: pane.availableHeight /2
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -50
                fillMode: Image.PreserveAspectFit
                source: "images/icon.png"

            }

            Rectangle{
                id: buttomAttId
                height: 40                
                anchors.margins: 20
                anchors.top: logo.bottom
                anchors.topMargin: 80
                anchors.left: parent.left
                anchors.right: parent.right
                color: "#41cd52"
                Text {
                    anchors.centerIn: parent
                    text: "Atualizar"
                    font.pixelSize: 15
                    color: "white"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        JS.dbInit()
                        readingsModelId.clear()
                        JS.dbReadAll()
                    }
                }
            }
            Rectangle{
                height: 30
                id: buttomFakeId
                anchors.margins: 20
                anchors.top: buttomAttId.bottom
                anchors.topMargin: 2
                anchors.left: parent.left
                anchors.right: parent.right
                color: "#41cd52"
                Text {
                    anchors.centerIn: parent
                    text: "Falsificar Dados"
                    font.pixelSize: 15
                    color: "white"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        JS.dbInit()
                        JS.fakeData()
                    }
                }
            }


        }
    }


    Dialog {
        //Editar esse menu para entrada dos numeros de IP
        id: settingsDialog
        x: Math.round((window.width - width) / 2)
        y: Math.round(window.height / 6)
        width: Math.round(Math.min(window.width, window.height) / 3 * 2)
        modal: true
        focus: true
        title: "Configurações"

        standardButtons: Dialog.Ok | Dialog.Cancel
        onAccepted: {
            settings.style = styleBox.displayText
            settingsDialog.close()
        }
        onRejected: {
            styleBox.currentIndex = styleBox.styleIndex
            settingsDialog.close()
        }

        contentItem: ColumnLayout {
            id: settingsColumn
            spacing: 20

            RowLayout {
                spacing: 10

                Label {
                    text: "IP:"
                }

                ComboBox {
                    id: styleBox
                    property int styleIndex: -1
                    Component.onCompleted: {
                        styleIndex = find(settings.style, Qt.MatchFixedString)
                        if (styleIndex !== -1)
                            currentIndex = styleIndex
                    }
                    Layout.fillWidth: true
                }
            }

            Label {
                text: "Restart required"
                color: "#e41e25"
                opacity: styleBox.currentIndex !== styleBox.styleIndex ? 1.0 : 0.0
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }

    Dialog {
        id: aboutDialog
        modal: true
        focus: true
        title: "Sobre"
        x: (window.width - width) / 2
        y: window.height / 6
        width: Math.min(window.width, window.height) / 3 * 2
        contentHeight: aboutColumn.height

        Column {
            id: aboutColumn
            spacing: 20

            Label {
                width: aboutDialog.availableWidth
                text: "Esta aplicação apresenta em tempo real os parametros ambientais da Estufa, e possibilita a alteração das variaveis de controle do ambiente."
                wrapMode: Label.Wrap
                font.pixelSize: 12
            }

            Label {
                width: aboutDialog.availableWidth
                text: "Através de Sensores e Controladores de Temperatura, Umidade, Iluminação e Taxa de Infravermelho "
                      + "é possivel se ter um controle ambiental excelente, melhorando a qualidade do ambiente para"
                      + "os especimes plantados."
                wrapMode: Label.Wrap
                font.pixelSize: 12
            }
        }
    }
}
