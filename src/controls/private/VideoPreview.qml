import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtMultimedia 5.8
import org.kde.mauikit 1.0 as Maui

ColumnLayout
{
    anchors.fill: parent
    property alias player: player

    Item
    {
        Layout.fillWidth: true
        Layout.preferredHeight: parent.width * 0.5
        Layout.margins: contentMargins

        Maui.ToolButton
        {
            anchors.centerIn: parent
            isMask: false
            flat: true
            size: iconSizes.huge
            iconName: iteminfo.icon
        }

        Video
        {
            id: player
            anchors.centerIn: parent
            anchors.fill: parent
            source: "file://"+currentUrl
            autoLoad: true
            
            Component.onCompleted: player.play()
        }

        MouseArea
        {
            anchors.fill: parent
            onClicked: player.playbackState === MediaPlayer.PlayingState ? player.pause() : player.play()
        }
        
        Rectangle
        {
			height: iconSizes.big
			width: height
			
			radius: height
			
			color: "black"
			
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.bottom: parent.bottom
			
			Maui.ToolButton
			{
				anchors.centerIn: parent
				iconName: player.playbackState === MediaPlayer.PlayingState ? "media-playback-pause" : "media-playback-start"
				iconColor: "white"
				onClicked: player.playbackState === MediaPlayer.PlayingState ? player.pause() : player.play()				
			}
		}
    }
    
    Item
    {
		visible: showInfo
		
		Layout.fillWidth: true
		Layout.fillHeight: true
		
		ScrollView
		{
			anchors.fill: parent
			
			contentHeight: _columnInfo.implicitHeight
			
			ColumnLayout
			{
				id: _columnInfo
				width: parent.width
				spacing: space.large
				// 			spacing: rowHeight
				
				
				Column
				{
					Layout.fillWidth: true
					spacing: space.small
					Label
					{
						visible: iteminfo.mime
						text: qsTr("Camera")
						font.pointSize: fontSizes.default
						font.weight: Font.Light
						color: colorScheme.textColor
						
						
					}
					
					Label
					{							 
						horizontalAlignment: Qt.AlignHCenter
						verticalAlignment: Qt.AlignVCenter
						elide: Qt.ElideRight
						wrapMode: Text.Wrap
						font.pointSize: fontSizes.big
						font.weight: Font.Bold
						font.bold: true
						text: player.metaData.cameraModel
						color: colorScheme.textColor
						
					}
				}
				
				Column
				{
					Layout.fillWidth: true
					spacing: space.small
					Label
					{
						visible: iteminfo.date						
						text: qsTr("Zoom ratio")
						font.pointSize: fontSizes.default
						font.weight: Font.Light			
						color: colorScheme.textColor
						
					}
					
					Label
					{							 
						horizontalAlignment: Qt.AlignHCenter
						verticalAlignment: Qt.AlignVCenter
						elide: Qt.ElideRight
						wrapMode: Text.Wrap
						font.pointSize: fontSizes.big
						font.weight: Font.Bold
						font.bold: true
						text: player.metaData.digitalZoomRatio
						color: colorScheme.textColor
						
					}
				}
				
				
				Column
				{
					Layout.fillWidth: true
					spacing: space.small
					Label
					{
						visible: iteminfo.modified						
						text: qsTr("Author")
						font.pointSize: fontSizes.default
						font.weight: Font.Light
						color: colorScheme.textColor
						
						
					}
					
					Label
					{							 
						horizontalAlignment: Qt.AlignHCenter
						verticalAlignment: Qt.AlignVCenter
						elide: Qt.ElideRight
						wrapMode: Text.Wrap
						font.pointSize: fontSizes.big
						font.weight: Font.Bold
						font.bold: true
						text: player.metaData.author
						color: colorScheme.textColor
						
					}
				}
				
				Column
				{
					Layout.fillWidth: true
					spacing: space.small
					Label
					{
						visible: iteminfo.owner						
						text: qsTr("Codec")
						font.pointSize: fontSizes.default
						font.weight: Font.Light
						color: colorScheme.textColor
						
						
					}
					
					Label
					{							 
						horizontalAlignment: Qt.AlignHCenter
						verticalAlignment: Qt.AlignVCenter
						elide: Qt.ElideRight
						wrapMode: Text.Wrap
						font.pointSize: fontSizes.big
						font.weight: Font.Bold
						font.bold: true
						text: player.metaData.videoCodec
						color: colorScheme.textColor
						
					}
				}
				
				Column
				{
					Layout.fillWidth: true
					spacing: space.small
					Label
					{
						visible: iteminfo.tags
						text: qsTr("Copyright")
						font.pointSize: fontSizes.default
						font.weight: Font.Light
						color: colorScheme.textColor
						
					}
					
					Label
					{							 
						horizontalAlignment: Qt.AlignHCenter
						verticalAlignment: Qt.AlignVCenter
						elide: Qt.ElideRight
						wrapMode: Text.Wrap
						font.pointSize: fontSizes.big
						font.weight: Font.Bold
						font.bold: true
						text: player.metaData.copyright
						color: colorScheme.textColor
						
					}
				}
				
				Column
				{
					Layout.fillWidth: true
					spacing: space.small
					Label
					{
						visible: iteminfo.permissions						
						text: qsTr("Duration")
						font.pointSize: fontSizes.default
						font.weight: Font.Light
						color: colorScheme.textColor
						
					}
					
					Label
					{							 
						horizontalAlignment: Qt.AlignHCenter
						verticalAlignment: Qt.AlignVCenter
						elide: Qt.ElideRight
						wrapMode: Text.Wrap
						font.pointSize: fontSizes.big
						font.weight: Font.Bold
						font.bold: true
						text: player.metaData.duration
						color: colorScheme.textColor
						
					}
				}
				
				Column
				{
					Layout.fillWidth: true
					spacing: space.small
					Label
					{
						visible: iteminfo.permissions						
						text: qsTr("Frame rate")
						font.pointSize: fontSizes.default
						font.weight: Font.Light
						color: colorScheme.textColor
						
					}
					
					Label
					{							 
						horizontalAlignment: Qt.AlignHCenter
						verticalAlignment: Qt.AlignVCenter
						elide: Qt.ElideRight
						wrapMode: Text.Wrap
						font.pointSize: fontSizes.big
						font.weight: Font.Bold
						font.bold: true
						text: player.metaData.videoFrameRate
						color: colorScheme.textColor
						
					}
				}
				
				Column
				{
					Layout.fillWidth: true
					spacing: space.small
					Label
					{
						visible: iteminfo.permissions						
						text: qsTr("Year")
						font.pointSize: fontSizes.default
						font.weight: Font.Light
						color: colorScheme.textColor
						
					}
					
					Label
					{							 
						horizontalAlignment: Qt.AlignHCenter
						verticalAlignment: Qt.AlignVCenter
						elide: Qt.ElideRight
						wrapMode: Text.Wrap
						font.pointSize: fontSizes.big
						font.weight: Font.Bold
						font.bold: true
						text: player.metaData.year
						color: colorScheme.textColor
						
					}
				}
				
				Column
				{
					Layout.fillWidth: true
					spacing: space.small
					Label
					{
						visible: iteminfo.permissions						
						text: qsTr("Aspect ratio")
						font.pointSize: fontSizes.default
						font.weight: Font.Light
						color: colorScheme.textColor
						
					}
					
					Label
					{							 
						horizontalAlignment: Qt.AlignHCenter
						verticalAlignment: Qt.AlignVCenter
						elide: Qt.ElideRight
						wrapMode: Text.Wrap
						font.pointSize: fontSizes.big
						font.weight: Font.Bold
						font.bold: true
						text: player.metaData.pixelAspectRatio
						color: colorScheme.textColor
						
					}
				}
				
				Column
				{
					Layout.fillWidth: true
					spacing: space.small
					Label
					{
						visible: iteminfo.permissions						
						text: qsTr("Resolution")
						font.pointSize: fontSizes.default
						font.weight: Font.Light
						color: colorScheme.textColor
						
					}
					
					Label
					{							 
						horizontalAlignment: Qt.AlignHCenter
						verticalAlignment: Qt.AlignVCenter
						elide: Qt.ElideRight
						wrapMode: Text.Wrap
						font.pointSize: fontSizes.big
						font.weight: Font.Bold
						font.bold: true
						text: player.metaData.resolution
						color: colorScheme.textColor
						
					}
				}
			}			
		}
	}
    
}
