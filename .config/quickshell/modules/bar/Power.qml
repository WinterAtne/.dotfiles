import QtQuick
import Quickshell.Services.UPower

Text {
	text: UPower.displayDevice.isLaptopBattery ? qsTr("%1%").arg(Math.round(UPower.displayDevice.percentage * 100)) : qsTr("No battery detected")
}
