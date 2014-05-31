import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    function generator() {
        var http = new XMLHttpRequest()
        var url = "http://www.random.org/integers/?num=1&min=1&max=100&col=1&base=10&format=plain&rnd=new"
        http.open("GET", url, true);
        var params = ""

        http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        http.setRequestHeader("Content-length", params.length);
        http.setRequestHeader("Connection", "close");

        loading.running= true

        http.onreadystatechange = function() { // Call a function when the state changes.
            if (http.readyState == 4) {
                if (http.status == 200) {
                    console.log("ok")

                    console.log(http.getAllResponseHeaders())
                    numberLabel.text = http.responseText
                    loading.running = false
                } else {
                    console.log("error: " + http.status)
                }
            }
        }
        http.send(params);
    }

    Component.onCompleted: {
        generator()
    }

    SilicaFlickable {
        anchors.fill: parent

        //contentHeight: column.height

        PushUpMenu {
            MenuItem{
                text: qsTr("Options")
            }
        }

        PullDownMenu {
            MenuItem {
                text: qsTr("New Random Number")
                onClicked: {
                    generator()
                }
            }
        }

        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge

            PageHeader {
                title: qsTr("Randomizer")
            }
        }

        Label {
            id: numberLabel
            x: Theme.paddingLarge
            anchors.centerIn: parent
            color: Theme.secondaryHighlightColor
            font.pixelSize: Theme.fontSizeExtraLarge * 4
            font.bold: true
        }

        BusyIndicator {
            id: loading
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: numberLabel.bottom
                //topMargin: Theme.paddingSmall
            }
        }
    }
}


