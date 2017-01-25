//
//  HUDDefault.swift
//  HUDMessage
//
//  Created by PSL on 1/24/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation

let DefaultDataSource: Dictionary<String, String> = [
    "title" : "it is title",
    "content" : "it is content",
    "buttonTitle" : "it is buttonTitle"
]


let DefaultConfig: Dictionary<String, Any> = [
    "notifyType" : HUDNotificationType.message,
    "duration": 0.5,
    "fullyDisplayed": true,
    "messagePos" : HUDMessageNotificationPostiion.top
]



let DefaultStyle: Dictionary<String, String> = [
    
    "imageName" : "TODO",
    "backgroundImageName" : "TODO",
    "textColor" : "EE352E",
    "titleFontSize" : "15",
    //"titleFontName" : "",
    "shadowColor" : "EE352E",
    "shadowOffsetX" : "20",
    "shadowOffsetY" : "20",
    
    "contentTextColor" : "EE352E",
    "contentFontSize" : "15",
    //"contentFontName" : ""
    "buttonBackgroundImageName" : "TODO",
    "notificationButtonBackground" : "TODO",
    "buttonTitleShadowColor" : "EE352E",
    "buttonTitleTextColor" : "EE352E",
    "buttonTitleShadowOffsetX" : "20",
    "buttonTitleShadowOffsetY" : "20",
    "borderHeight" : "TODO",
    "borderColor" : "TODO",
]
