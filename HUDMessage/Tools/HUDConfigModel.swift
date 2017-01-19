//
//  ConfigModel.swift
//  HUDMessage
//
//  Created by PSL on 1/18/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

struct ConfigModel {
    var imageName: String
    var backgroundImageName: String
    
    var textColor: String
    var titleFontSize: CGFloat
    
    var shadowColor: String
    var shadowOffsetX: CGFloat
    var shadowOffsetY: CGFloat
    
    var contentTextColor: String
    var contentFontSize: CGFloat
    
    
    var titleFontName: String?
    var contentFontName: String?
    /*
    var buttonBackgroundImageName: String
    var notificationButtonBackground: String
    var buttonTitleShadowColor: String
    var buttonTitleTextColor: String
    var buttonTitleShadowOffsetX: CGFloat
    var buttonTitleShadowOffsetY: CGFloat
    */
    var borderHeight: CGFloat
    var borderColor: String
    
    init?(dict: Dictionary<String, Any>?) {
        guard
            let imageName = dict?[HUDConfigKeys.imageName] as? String,
            let backgroundImageName = dict?[HUDConfigKeys.backgroundImageName] as? String,
            let textColor = dict?[HUDConfigKeys.textColor] as? String,
            let titleFontSize = dict?[HUDConfigKeys.titleFontSize] as? CGFloat,
            let shadowColor = dict?[HUDConfigKeys.shadowColor] as? String,
            let shadowOffsetX = dict?[HUDConfigKeys.shadowOffsetX] as? CGFloat,
            let shadowOffsetY = dict?[HUDConfigKeys.shadowOffsetY] as? CGFloat,
            let contentTextColor = dict?[HUDConfigKeys.contentTextColor] as? String,
            let contentFontSize = dict?[HUDConfigKeys.contentFontSize] as? CGFloat,
            let borderHeight = dict?[HUDConfigKeys.borderHeight] as? CGFloat,
            let borderColor = dict?[HUDConfigKeys.borderColor] as? String
        else {
            return nil
        }
        
        self.imageName = imageName
        self.backgroundImageName = backgroundImageName
        self.textColor = textColor
        self.titleFontSize = titleFontSize
        self.shadowColor = shadowColor
        self.shadowOffsetX = shadowOffsetX
        self.shadowOffsetY = shadowOffsetY
        self.contentTextColor = contentTextColor
        self.contentFontSize = contentFontSize
        self.borderHeight = borderHeight
        self.borderColor = borderColor
        
        self.titleFontName = dict?[HUDConfigKeys.titleFontName] as? String
        self.contentFontName = dict?[HUDConfigKeys.contentFontName] as? String
    }
}












