import QtQuick 2.9
import QtQml 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import "qrc:///WebAPI.js" as WebAPI


Page {
    property string myAPI: ""
    property string myCoin: ""
    property string myConfirmedValue: ""
    property string myUnconfirmedValue: ""
    property string myHashrate: ""
    property string myUpdateValue: ""
    property string myIcon: ""
    property string myCoinValueDollar: ""
    property string cryptoCompareAPI: "https://min-api.cryptocompare.com/data/pricemulti?fsyms=ZEC,XMR,ETN,ZCL&tsyms=USD"

    function update()
    {
        WebAPI.get_Method(myAPI)
        WebAPI.get_Method2(cryptoCompareAPI)

    }


    Component.onCompleted: {
        update()
    }



    Rectangle{
        id:rootId
        anchors.fill:parent
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

                source: myIcon



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
                text:"Last Update : "+myUpdateValue
                anchors.bottom: txId.top
                anchors.bottomMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                color:"#fafafa"

                font {
                    family: "Halvetica"
                    italic: false
                    pointSize: 16
                }
            }

            Text{
                id:txId
                text:"Confirmed : "+myConfirmedValue+"("+myConfirmedValue*myCoinValueDollar+" $)"
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
                text:"Unconfirmed : "+myUnconfirmedValue+"("+myUnconfirmedValue*myCoinValueDollar+" $)"
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
//            Text{
//                text:"Total : "+ (myUnconfirmedValue+myUnconfirmedValue)
//                anchors.top:tx2Id.bottom
//                anchors.verticalCenter: parent.verticalCenter
//                anchors.horizontalCenter: parent.horizontalCenter
//                color:"#fafafa"

//                font {
//                    family: "Halvetica"
//                    italic: false
//                    pointSize: 26
//                }



//            }
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
