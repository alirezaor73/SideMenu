import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import Crystal 1.0

Window {
    width: 500
    height: 690
    visible: true
    title: qsTr("newMenu")

    ////topbar header
    Rectangle{
        id: topbar
        z:2
        height: 50
        width: parent.width
        gradient: Gradient{
            GradientStop{position: 0.0 ; color:"#e0e0e0"}
            GradientStop{position: 1.0 ; color:"#a0a0a0"}
        }

        Text {
            id: titletop
            anchors.centerIn: parent
            text: qsTr("This Is a Menu")
            font.bold: true
            font.pointSize: 20
        }

        Rectangle{
            id:wprBtn
            width: 70
            height: 30
            radius: 30
            color: "white"
            x:10
            y:10

            Text {
                id: menubtn
                text: qsTr("MENU")// This is available in all editors.
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                //////////////////////
                onClicked: oplose();
            }
        }
    }

    /// main content
    Rectangle{
        id: maincontent
        z: 0
        y: 50
        width: parent.width
        height: parent.height - 50
        color: "#f4f4f4"
        Text{
            anchors.centerIn: parent
            text: qsTr("This is a text about nothing .")
        }
        Button{
            text: "hi"
            x:300
        }
    }

    ///click functions
    function oplose(){
        if(container.x === -300){
            //opshadow.running = true
            wpropen.running = true

        }else{
            //clshadow.running = true
            wprclose.running = true
        }
    }



    NumberAnimation {id:wpropen;  running: false ; target: container ; property: "x";       to: 0   ; duration: 200 ; easing.type:Easing.OutCubic}
    NumberAnimation {id:wprclose; running: false ; target: container ; property: "x";       to:-300 ; duration: 200 ; easing.type:Easing.InCubic}


    ////shadow efect
    Rectangle{
        z:1
        id: shadow
        anchors.fill: parent
        color: "black"
        opacity: 0.0
    }

    ///wrapper container
    Rectangle{
        id:container
        width: 300
        height: stack.height
        color: "gray"
        y:50
        z:2
        x: -300

        TabBar {
            id: bar
            width: parent.width
            height: 40
            TabButton {
                text: qsTr("Last UI")
            }
            TabButton {
                text: qsTr("GridView")
            }
            TabButton {
                text: qsTr("TableView")
            }
            TabButton {
                text: qsTr("Model")
            }
        }

        StackLayout {
            id: stack
            anchors.top: bar.bottom
            width: parent.width
            currentIndex: bar.currentIndex


            Item {
                id: lastui
                Rectangle {
                    id: rootItem
                    width: 300
                    height: 600
                    visible: true

                    Rectangle{
                        id: bg1
                        anchors.fill: parent
                        color: "#c0c0c0"
                    }

                    Rectangle{
                        id: bg2
                        anchors.centerIn: parent
                        border.color: "black"
                        border.width: 2
                        radius: 15
                        width: parent.width - 20
                        height: parent.height - 30
                        gradient: Gradient{
                            GradientStop { position:0.0 ; color:"#e0e0e0"}
                            GradientStop { position:1.0 ; color:"#b0b0b0"}
                        }


                        Column {
                            id: menu
                            anchors.centerIn: bg2
                            spacing: 15

                            Text {
                                id: title
                                text: qsTr("Navigation")
                                font.bold: true
                                font.pointSize: 20
                            }

                            Button {
                                id: btn1
                                text: "Slot Btn"
                                anchors.horizontalCenter: parent.horizontalCenter
                                onClicked: {
                                    btn1.highlighted = true
                                    testing.whatToDo()
                                }
                            }

                            Button {
                                id: btn2
                                text: "Start"
                                anchors.horizontalCenter: parent.horizontalCenter
                                onClicked: {
                                    btn2.highlighted = true
                                    msign.start()
                                }
                            }

                            Button {
                                id: btn3
                                text: "Stop"
                                anchors.horizontalCenter: parent.horizontalCenter
                                onClicked: {
                                    btn3.highlighted = true
                                    msign.stop()
                                }
                            }

                            Text {
                                id: dataShow
                                text: "Push Start"
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.bold: true
                                font.italic: true
                                font.pointSize: 20
                                color: "red"
                            }


                            Button {
                                id: btn4
                                text: "BTN 4"
                                anchors.horizontalCenter: parent.horizontalCenter
                                onClicked: {
                                    var passnum = Math.round(Math.random() *100)
                                    dataShow.text = Try.work(passnum)
                                }
                            }
                        }
                    }
                }
            }

            Item {
                id: layouts
                Rectangle{
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "black"
                    width: parent.width
                    visible: true
                    implicitHeight: grid.implicitHeight + grid.rows*grid.rowSpacing


                    GridLayout{
                        id: grid
                        anchors.fill: parent
                        columnSpacing: 5
                        rowSpacing: 5
                        columns:2
                        rows: 6
                        layoutDirection: Qt.RightToLeft
                        anchors.margins: 5


                        Rectangle{
                            Layout.fillWidth: true
                            color: "red"
                            height: 30
                        }

                        Rectangle{
                            Layout.fillWidth: true
                            color: "yellow"
                            height: 30
                        }

                        Rectangle{
                            Layout.fillWidth: true
                            color: "blue"
                            height: 30
                        }
                        Rectangle{
                            Layout.fillWidth: true
                            color: "white"
                            height: 30
                        }

                        Rectangle{
                            Layout.fillWidth: true
                            color: "green"
                            height: 30
                        }

                        Rectangle{
                            Layout.fillWidth: true
                            color: "brown"
                            height: 30
                        }
                    }
                }
            }
            Item {
                id: table

                Rectangle{
                    id: tableContainer
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "blue"
                    implicitHeight: myTable.rows *26
                    width: 300

                    TableView {
                        id: myTable
                        anchors.fill: parent
                        columnSpacing: 1
                        rowSpacing: 1
                        clip: true

                        model: ElahiTableModel {}

                        delegate: Rectangle {
                            implicitWidth: 50
                            implicitHeight: 25
                            border.width: 1
                            color: "cyan"

                            Text {
                                text: txtPass
                                anchors.centerIn: parent
                            }
                        }
                    }
                }
            }
        }
    }
}


//////new task  /// layout Table resizable
