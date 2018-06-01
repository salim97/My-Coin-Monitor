import QtQuick 2.9
import QtQuick.Window 2.2
import "qrc:///WebAPI.js" as WebAPI

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    Item {
    anchors.fill: parent

        Component.onCompleted: {
            WebAPI.get_Method("http://zcash.miningpoolhub.com/index.php?page=api&action=getdashboarddata&api_key=742758491e8a20de3544d78c4120b5313f41cfc1ca45fb5ce7521d512c3d07ec")
        }

        Text {
            id: currentZEC
            anchors.centerIn: parent
            text: qsTr("ZEC: X,X")

        }
        Text {
            id: lastUPDATE
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top

            text: "hh:mm:ss"
        }
    }

}
