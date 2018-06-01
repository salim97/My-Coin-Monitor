import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import Qt.labs.settings 1.0
import "qrc:///WebAPI.js" as WebAPI

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


    property string myKey: ""
    Settings { // TODO c++ better
            id: settings
            property string apiKEY: "742758491e8a20de3544d78c4120b5313f41cfc1ca45fb5ce7521d512c3d07ec"
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

        CustomRect {
            id:zecId
            myAPI: "http://zcash.miningpoolhub.com/index.php?page=api&action=getdashboarddata&api_key="+myKey
            myCoin: "ZEC"

        }
        CustomRect {
            id:xmrId
            myAPI: "http://monero.miningpoolhub.com/index.php?page=api&action=getdashboarddata&api_key="+myKey
            myCoin: "XMR"

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
