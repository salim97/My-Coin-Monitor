import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import Qt.labs.settings 1.0

Page {
    //anchors.fill: parent
    property string myAPI: ""
    property string myCoin: ""
    property string myConfirmedValue: ""
    property string myUnconfirmedValue: ""
    property string myHashrate: ""



    Rectangle{
        id:rootId
        anchors.fill:parent
        //anchors.margins: 20
        color: "#151c1d"


        Frame {
            id: frame
            anchors.fill: parent
            anchors.margins: 50
            Text {
                text: "Config API KEY"
                anchors.top:parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 10
                color: "#a6b8b9"
                font.family: "Roboto"
                font.pointSize: 15

            }

            TextField{
                id:txId
                text:settings.apiKEY
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                color:"#fafafa"
                width: parent.width
                onTextChanged: {
                    settings.apiKEY = text
                }

            }



        }

    }
}
