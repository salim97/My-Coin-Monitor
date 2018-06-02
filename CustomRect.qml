import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import "qrc:///WebAPI.js" as WebAPI


Page {
    //anchors.fill: parent
    property string myAPI: ""
    property string myCoin: ""
    property string myConfirmedValue: ""
    property string myUnconfirmedValue: ""
    property string myHashrate: ""
    property string myIcon: ""
    property string myIconBorder: ""


    Component.onCompleted: {
        update()
    }

    function update()
    {
        WebAPI.get_Method(myAPI)
    }

    Rectangle{
        id:rootId
        anchors.fill:parent
        //anchors.margins: 20
        color: "#151c1d"


        Frame {
            id: frame
            anchors.fill: parent
            anchors.margins: 50

            Image{

                anchors.top: parent.top
                anchors.left: parent.left

                height: parent.height/4
                width:height

                source: (myHashrate == "0" )?myIcon:myIconBorder



            }

            Text {
                text: myCoin
                anchors.top:parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 10
                color: "#a6b8b9"
                font.family: "Roboto"
                font.pointSize: 15

            }

            Text{
                id:txId
                text:"Confirmed : "+myConfirmedValue
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                color:"#fafafa"

                font {
                    family: "Halvetica"
                    italic: false
                    pointSize: 26
                }
            }

            Text{
                id:tx2Id
                text:"Unconfirmed : "+myUnconfirmedValue
                anchors.top:txId.bottom
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                color:"#fafafa"

                font {
                    family: "Halvetica"
                    italic: false
                    pointSize: 26
                }


            }

            Text{

                text:"Hashrate : "+myHashrate+ " h/s"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                color:"#fafafa"

                font {
                    family: "Halvetica"
                    italic: false
                    pointSize: 22
                }


            }



        }

    }
}
