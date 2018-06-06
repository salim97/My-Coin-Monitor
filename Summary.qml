import QtQuick 2.9
import QtQml 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.3



Page {
    property string myTotal: "0"

    
    //    ListModel {
    //        id: myModel
    //        ListElement { icon: "Dog"; name: 8; confirmed:0; unconfirmed: 0; usdValue: 0}
    //        ListElement { type: "Cat"; age: 5 }
    //        ListElement { type: "Cat"; age: 5 }
    //        ListElement { type: "Cat"; age: 5 }


    //    }
    
    //    Component {
    //        id: myDelegate


    //    }
    
    //    ListView {
    //        anchors.top:parent.top
    //        anchors.bottom: totalId.top
    //        model: myModel
    //        delegate: myDelegate
    //    }
    
    Repeater {
        model: [ "yo", "lo", "bitch"]

        Rectangle {
            color: "white"

            width: parent.width
            height: dp(48)

            Text{
                text:modelData

                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                color:"#fafafa"

                font {
                    family: "Halvetica"
                    italic: false
                    pointSize: 16
                }
            }



        }





        Rectangle{
            id:totalId
            anchors.bottom: parent.bottom
            width:parent.width
            height: parent.height/8
            Text{

                text:"Total : "+myTotal
                anchors.horizontalCenter: parent.horizontalCenter
                color:"#fafafa"

                font {
                    family: "Halvetica"
                    italic: false
                    pointSize: 16
                }
            }



        }



    }
}
