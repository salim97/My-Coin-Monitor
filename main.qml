import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import Qt.labs.settings 1.0
import "qrc:///WebAPI.js" as WebAPI

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("MiningPoolHub")


    property string myKey: ""
    Settings { // TODO C++ better
        id: settings
        property string apiKEY: "e549c8c43d3bab52e8779d614ba05278abd0007c8c3e0aeb7783804cb77f9c27"
    }
    Component.onCompleted: {
        myKey = settings.apiKEY
    }

    Timer{
        repeat: true
        interval: 15 * 1000 // chaque 15 sec
        onTriggered: {
            zecId.update()
            xmrId.update()
            zclId.update()
            etnId.update()
        }
    }


    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

//        Summary{

//        }

        CustomRect {
            id:zecId
            myAPI: "http://zcash.miningpoolhub.com/index.php?page=api&action=getdashboarddata&api_key="+myKey
            myCoin: "ZEC"
            myIcon: "qrc:///icons/zcash.png"


        }
        CustomRect {
            id:xmrId
            myAPI: "http://monero.miningpoolhub.com/index.php?page=api&action=getdashboarddata&api_key="+myKey
            myCoin: "XMR"
            myIcon: "qrc:///icons/monero.png"

        }
        CustomRect {
            id:zclId
            myAPI: "http://zclassic.miningpoolhub.com/index.php?page=api&action=getdashboarddata&api_key="+myKey
            myCoin: "ZCL"



        }
        CustomRect {
            id:etnId
            myAPI: "http://electroneum.miningpoolhub.com/index.php?page=api&action=getdashboarddata&api_key="+myKey
            myCoin: "ETN"

        }

        Config{


        }



    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

//        TabButton {
//            text: qsTr("Summary")
//        }
        TabButton {
            text: qsTr("ZCash")
        }
        TabButton {
            text: qsTr("Monero")
        }
        TabButton {
            text: qsTr("ZClassic")
        }

        TabButton {
            text: qsTr("Electroneum")
        }
        TabButton {
            text: qsTr("Config")
        }

    }


}
