/*
 *   Copyright 2018 Camilo Higuita <milo.h@aol.com>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 2, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.12
import QtQuick.Controls 2.3

import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import QtQuick.Window 2.3

import org.kde.kirigami 2.7 as Kirigami
import org.kde.mauikit 1.0 as Maui
import org.kde.mauikit 1.1 as MauiLab

import "private"

Window
{
	id: root
	visible: true
	width: Screen.desktopAvailableWidth * (Kirigami.Settings.isMobile ? 1 : 0.4)
	height: Screen.desktopAvailableHeight * (Kirigami.Settings.isMobile ? 1 : 0.4)
	
	property Maui.AbstractSideBar sideBar
	
	/***************************************************/
	/******************** ALIASES *********************/
	/*************************************************/
	default property alias content : _content.data
		
		property alias headBar : _page.headBar
		property alias footBar: _page.footBar
		property alias footer: _page.footer
		property alias header :_page.header
		
		property alias dialog: dialogLoader.item
		
		property alias leftIcon : menuBtn
		property alias menuButton : menuBtn
		
		property alias mainMenu : mainMenu.contentData
		property alias about : aboutDialog
		property alias accounts: _accountsDialogLoader.item
        property var currentAccount: Maui.App.handleAccounts ? Maui.App.accounts.currentAccount : ({})
		property alias notifyDialog: _notify
		
		/***************************************************/
		/*********************** UI ***********************/
		/*************************************************/
		
		property bool isWide : root.width >= Kirigami.Units.gridUnit * 30
		
		property alias flickable : _page.flickable
		
		property int footerPositioning : _page.footerPositioning
		property int headerPositioning : _page.headerPositioning
			
		/***************************************************/
		/********************* COLORS *********************/
		/*************************************************/
		property color headBarBGColor: Kirigami.Theme.backgroundColor
		property color headBarFGColor: Kirigami.Theme.textColor
		
		
		/***************************************************/
		/**************** READONLY PROPS ******************/
		/*************************************************/
		
		readonly property bool isMobile : Kirigami.Settings.isMobile
		readonly property bool isAndroid: Maui.Handy.isAndroid
		readonly property bool isTouch: Maui.Handy.isTouch
		
		readonly property real screenWidth : Screen.width
		readonly property real screenHeight : Screen.height
		
		/***************************************************/
		/******************** SIGNALS *********************/
		/*************************************************/
		signal menuButtonClicked();
		
		onClosing:
		{
			if(!Kirigami.Settings.isMobile)
			{
				const height = root.height
				const width = root.width
				const x = root.x
				const y = root.y
				Maui.FM.saveSettings("GEOMETRY", Qt.rect(x, y, width, height), "WINDOW")
			}
		}
		
		property bool isPortrait: Screen.primaryOrientation === Qt.PortraitOrientation || Screen.primaryOrientation === Qt.InvertedPortraitOrientation
		
		color: Maui.App.enableCSD ? "transparent" : Kirigami.Theme.backgroundColor
        flags: Maui.App.enableCSD ? Qt.FramelessWindowHint : Qt.Window
				
		Rectangle
		{
			id: _rect
			anchors.fill: parent
			color: Kirigami.Theme.backgroundColor
			border.color: Maui.App.enableCSD ? Qt.tint(Kirigami.Theme.textColor, Qt.rgba(Kirigami.Theme.backgroundColor.r, Kirigami.Theme.backgroundColor.g, Kirigami.Theme.backgroundColor.b, 0.5)) : "transparent"
			radius: root.visibility === Window.Maximized || !Maui.App.enableCSD ? 0 : 6
			
			Maui.Page
			{
				id: _page
				anchors.fill: parent
				anchors.margins: Maui.App.enableCSD ? 1 : 0
				
				Kirigami.Theme.colorSet: Kirigami.Theme.Window
				
				headBar.leftContent: [ 			
				
				ToolButton
				{
					id: menuBtn
					icon.name: "application-menu"
					icon.color: headBarFGColor
					icon.width: Maui.Style.iconSizes.medium
					icon.height: Maui.Style.iconSizes.medium
					checked: mainMenu.visible
					onClicked:
					{
						menuButtonClicked()
						mainMenu.visible ? mainMenu.close() : mainMenu.popup(parent, parent.x , parent.height+ Maui.Style.space.medium)
					}
					
					Menu
					{
						id: mainMenu
						modal: true
						z: 999
						width: Maui.Style.unit * 250
						
						Loader
						{
							id: _accountsMenuLoader
							width: parent.width * 0.9
							anchors.horizontalCenter: parent.horizontalCenter
							
							active: Maui.App.handleAccounts
							sourceComponent: Maui.App.handleAccounts ?
							_accountsComponent : null
						}
						
						MenuItem
						{
							text: qsTr("About")
							icon.name: "documentinfo"
							onTriggered: aboutDialog.open()
						}
					}
				}
				]
				
				headBar.rightContent: 	Loader
				{
					active: Maui.App.enableCSD
					Layout.preferredWidth: visible ? implicitWidth : 0
					Layout.fillHeight: true
					sourceComponent: MauiLab.WindowControls
					{
						
					}
				}
				
				
				Item
				{
					id: _content
					anchors.fill: parent
					Kirigami.Theme.inherit: false
					
					transform: Translate 
					{
						x: root.sideBar && root.sideBar.collapsible && root.sideBar.collapsed ? root.sideBar.position * (root.sideBar.width - root.sideBar.collapsedSize) : 0
					}
					
					anchors.leftMargin: root.sideBar ? ((root.sideBar.collapsible && root.sideBar.collapsed) ? root.sideBar.collapsedSize : root.sideBar.width * root.sideBar.position) : 0
				}
				
				
				layer.enabled: true
				layer.effect: OpacityMask
				{
					maskSource: Item
					{
						width: _rect.width
						height: _rect.height
						
						Rectangle
						{
							anchors.centerIn: parent
							width: _rect.width
							height: _rect.height
							radius: _rect.radius
						}
					}
				}
				
			}
		}
		
		// DropShadow 
		// {
		// 	anchors.fill: parent
		// 	horizontalOffset: 0
		// 	verticalOffset: 0
		// 	radius: 8.0
		// 	samples: 17
		// 	color: "#80000000"
		// 	source: _rect
		// }
		
		
		
		//     onHeadBarBGColorChanged:
		//     {
		//         if(!isMobile && colorSchemeName.length > 0)
		//             Maui.KDE.setColorScheme(colorSchemeName, headBarBGColor, headBarFGColor)
		//         else if(isAndroid && headBar.position === ToolBar.Header)
		//             Maui.Android.statusbarColor(headBarBGColor, false)
		// 			else if(isAndroid && headBar.position === ToolBar.Footer)
		// 				Maui.Android.statusbarColor(Kirigami.Theme.viewBackgroundColor, true)
		//
		//     }
		//
		//     onHeadBarFGColorChanged:
		//     {
		// 		if(!isAndroid && !isMobile && colorSchemeName.length > 0 && headBar.position === ToolBar.Header)
		//             Maui.KDE.setColorScheme(colorSchemeName, headBarBGColor, headBarFGColor)
		// 			else if(isAndroid && headBar.position === ToolBar.Header)
		//             Maui.Android.statusbarColor(headBarBGColor, false)
		// 			else if(isAndroid && headBar.position === ToolBar.Footer)
		// 				Maui.Android.statusbarColor(Kirigami.Theme.viewBackgroundColor, true)
		//     }
		/*
		 *    background: Rectangle
		 *    {
		 *        color: bgColor
}
*/
		
		// 	overlay.modal: Rectangle 
		// 	{
		//         color: Qt.rgba(root.Kirigami.Theme.backgroundColor.r,root.Kirigami.Theme.backgroundColor.g,root.Kirigami.Theme.backgroundColor.b, 0.5)
		// 	}
		// 	
		// 	overlay.modeless: Rectangle 
		// 	{
		// 		color: "transparent"
		// 	}
		
		Component
		{
			id: _accountsComponent
			
			ColumnLayout
			{
				visible: Maui.App.handleAccounts
				spacing: Maui.Style.space.medium
				
				Kirigami.Icon
				{
					visible: Maui.App.accounts.currentAccountIndex >= 0
					source: "user-identity"
					Layout.preferredHeight: Maui.Style.iconSizes.large
					Layout.preferredWidth: Maui.Style.iconSizes.large
					Layout.alignment:  Qt.AlignCenter
					Layout.margins: Maui.Style.space.medium
				}
				
				Label
				{
					visible: Maui.App.accounts.currentAccountIndex >= 0
					text: currentAccount.user
					Layout.fillWidth: true
					horizontalAlignment: Qt.AlignHCenter
					elide: Text.ElideMiddle
					wrapMode: Text.NoWrap
					font.bold: true
					font.weight: Font.Bold
				}
				
				Kirigami.Separator
				{
					visible: _accountsListing.count > 0
					Layout.fillWidth: true
				}
				
				ListBrowser
				{
					id: _accountsListing
					visible: _accountsListing.count > 0
					Layout.fillWidth: true
					Layout.preferredHeight: Math.min(contentHeight, 300)
					spacing: Maui.Style.space.medium
					Kirigami.Theme.backgroundColor: "transparent"
					currentIndex: Maui.App.accounts.currentAccountIndex
					
					model:  Maui.BaseModel
					{
						list: Maui.App.accounts
					}
					
					delegate: Maui.ListBrowserDelegate
					{
						iconSource: "amarok_artist"
						iconSizeHint: Maui.Style.iconSizes.medium
						label1.text: model.user
						label2.text: model.server
						width: _accountsListing.width
						height: Maui.Style.rowHeight * 1.2
						leftPadding: Maui.Style.space.tiny
						rightPadding: Maui.Style.space.tiny
						onClicked: Maui.App.accounts.currentAccountIndex = index
					}
					
					Component.onCompleted:
					{
						if(_accountsListing.count > 0)
							Maui.App.accounts.currentAccountIndex = 0
					}
				}
				
				Kirigami.Separator
				{
					visible: _accountsListing.count > 0
					Layout.fillWidth: true
				}
				
				Button
				{
					Layout.margins: Maui.Style.space.small
					Layout.preferredHeight: implicitHeight
					Layout.alignment: Qt.AlignCenter
					text: qsTr("Manage accounts")
					icon.name: "list-add-user"
					onClicked:
					{
						if(root.accounts)
							accounts.open()
							
							mainMenu.close()
					}
					
					Kirigami.Theme.backgroundColor: Qt.rgba(Kirigami.Theme.backgroundColor.r, Kirigami.Theme.backgroundColor.g, Kirigami.Theme.backgroundColor.b, 0.1)
					Kirigami.Theme.textColor: Kirigami.Theme.textColor
				}
				
				Kirigami.Separator
				{
					Layout.fillWidth: true
				}
				
			}
		}
		
		
		AboutDialog
		{
			id: aboutDialog
		}
		
		Loader
		{
			id: _accountsDialogLoader
			source: Maui.App.handleAccounts ? "private/AccountsHelper.qml" : ""
		}
		
		Maui.Dialog
		{
			id: _notify
			property var cb : ({})
			
			property alias iconName : _notifyTemplate.iconSource
			property alias title : _notifyTemplate.label1
			property alias body: _notifyTemplate.label2
			
			verticalAlignment: Qt.AlignTop
			defaultButtons: _notify.cb !== null
				rejectButton.visible: false
				onAccepted:
				{
					if(_notify.cb)
					{
						_notify.cb()
						_notify.close()
					}
				}
				
				page.padding: Maui.Style.space.medium
				
				footBar.background: null
				
				maxHeight: Math.max(Maui.Style.iconSizes.large + Maui.Style.space.huge, (_notifyTemplate.implicitHeight)) + Maui.Style.space.big + footBar.height
				maxWidth: Kirigami.Settings.isMobile ? parent.width * 0.9 : Maui.Style.unit * 500
				widthHint: 0.8
				
				Timer
				{
					id: _notifyTimer
					onTriggered:
					{
						if(_mouseArea.containsPress || _mouseArea.containsMouse)
							return;
						
						_notify.close()
					}
				}
				
				onClosed: _notifyTimer.stop()
				
				Maui.ListItemTemplate
				{
					id: _notifyTemplate
					anchors.fill: parent
					iconSizeHint: Maui.Style.iconSizes.huge
					label1.font.bold: true
					label1.font.weight: Font.Bold
					label1.font.pointSize: Maui.Style.fontSizes.big
					iconSource: "dialog-warning"
				}
				
				MouseArea
				{
					id: _mouseArea
					height: parent.height
					width: parent.width
					anchors.centerIn: parent
					hoverEnabled: true
				}
				
				function show(callback)
				{
					_notify.cb = callback || null
					_notifyTimer.start()
					_notify.open()
				}
		}
		
		Loader
		{
			id: dialogLoader
		}
		
		Component.onCompleted:
		{
			if(isAndroid)
			{
				if(headBar.position === ToolBar.Footer)
					Maui.Android.statusbarColor(Kirigami.Theme.backgroundColor, true)
					else
						Maui.Android.statusbarColor(headBar.Kirigami.Theme.backgroundColor, true)
			}
			
			if(!Kirigami.Settings.isMobile)
			{
				const rect = Maui.FM.loadSettings("GEOMETRY", "WINDOW", Qt.rect(root.x, root.y, root.width, root.height))
				root.x = rect.x
				root.y = rect.y
				root.width = rect.width
				root.height = rect.height
			}
		}
		
		function notify(icon, title, body, callback, timeout, buttonText)
		{
			_notify.iconName = icon || "emblem-warning"
			_notify.title.text = title
			_notify.body.text = body
			_notifyTimer.interval = timeout ? timeout : 2500
			_notify.acceptButton.text = buttonText || qsTr ("Accept")
			_notify.show(callback)
		}
		
		function toggleMaximized()
		{
			if (root.visibility === Window.Maximized) {
				root.showNormal();
			} else {
				root.showMaximized();
			}
		}
		
		function window()
		{
			return _page;
		}
}
