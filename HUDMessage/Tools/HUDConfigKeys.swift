//
//  ConfigKeys.swift
//  HUDMessage
//
//  Created by PSL on 1/18/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation

let TestStyle: Dictionary<String, String> = [
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

struct HUDMessageTypeKeys {
    static let message = "message"
    static let error = "error"
    static let success = "success"
    static let warning = "warning"
}



struct HUDConfigKeys {
    static let imageName = "imageName"
    static let backgroundImageName = "backgroundImageName"
    static let textColor = "textColor"
    static let titleFontSize = "titleFontSize"
    static let titleFontName = "titleFontName"
    static let shadowColor = "shadowColor"
    static let shadowOffsetX = "shadowOffsetX"
    static let shadowOffsetY = "shadowOffsetY"
    static let contentTextColor = "contentTextColor"
    static let contentFontSize = "contentFontSize"
    static let contentFontName = "contentFontName"
    static let buttonBackgroundImageName = "buttonBackgroundImageName"
    static let notificationButtonBackground = "notificationButtonBackground"
    static let buttonTitleShadowColor = "buttonTitleShadowColor"
    static let buttonTitleTextColor = "buttonTitleTextColor"
    static let buttonTitleShadowOffsetX = "buttonTitleShadowOffsetX"
    static let buttonTitleShadowOffsetY = "buttonTitleShadowOffsetY"
    static let borderHeight = "borderHeight"
    static let borderColor = "borderColor"
}
