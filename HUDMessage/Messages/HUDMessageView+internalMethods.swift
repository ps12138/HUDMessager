//
//  HUDMessageView+internalMethods.swift
//  HUDMessage
//
//  Created by PSL on 1/18/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Internal Methods
extension HUDMessageView {
    
    internal func set(notifyType type: HUDNotificationType) -> String {
        switch type {
        case .message:
            return "message"
        case .error:
            return "error"
        case .success:
            return "success"
        case .warning:
            return "warning"
        default:
            return "Unknown"
        }
    }
    
    ///
    internal func set(blurStyle: Bool) {
        self.backgroundColor = UIColor.clear
        guard let backgroundImage = UIImage(contentsOfFile: Constants.bgImage) else {
            return
        }
        backgroundImage.stretchableImage(withLeftCapWidth: 0, topCapHeight: 0)
        backgroundImageView = UIImageView(image: backgroundImage)
        self.addSubview(backgroundImageView)
    }
    
    ///
    internal func set(titleLabelWith config: ConfigModel) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textColor = UIColor.getColor(RGBstring: config.textColor)
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize: config.titleFontSize)
        label.shadowColor = UIColor.getColor(RGBstring: config.shadowColor)
        label.shadowOffset = CGSize(width: config.shadowOffsetX, height: config.shadowOffsetY)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        self.addSubview(label)
        return label
    }

    ///
    internal func set(contentLabelWith config: ConfigModel) -> UILabel? {
        
        guard let content = content else {
            return nil
        }
        let label = UILabel()
        label.text = content
        label.textColor = UIColor.getColor(RGBstring: config.contentTextColor)
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize: config.contentFontSize)
        label.shadowColor = UIColor.getColor(RGBstring: config.shadowColor)
        label.shadowOffset = CGSize(width: config.shadowOffsetX, height: config.shadowOffsetY)
        label.numberOfLines = 0;
        label.lineBreakMode = .byWordWrapping
        self.addSubview(label)
        return label
        
    }
    
    ///
    internal func set(iconImageWith image: UIImage) -> UIImageView {
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: padding * 2, y: padding, width: image.size.width, height: image.size.height)
        self.addSubview(imageView)
        return imageView
    }
    
    ///
    internal func set(borderWith config: ConfigModel) {
        
        guard let screenWidth = self.viewController?.view.bounds.size.width else {
            return
        }
        
        let borderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: config.borderHeight))
        borderView.backgroundColor = UIColor.getColor(RGBstring: config.borderColor)
        borderView.autoresizingMask = .flexibleWidth
        self.addSubview(borderView)
    }
    
    ///
    internal func updateHeight() -> CGFloat {
        guard let screenWidth = self.viewController?.view.bounds.size.width
            else {
            return 0.0
        }
        let padding = self.padding
        var currentHeight: CGFloat = 0.0
        
        // setting size of titleLabel
        titleLabel.frame = CGRect(x: self.textSpaceLeft, y: padding, width: screenWidth - padding - self.textSpaceLeft - self.textSpaceRight, height: 0.0)
        titleLabel.sizeToFit()
        
        // setting size of contentLabel
        if let contentLabel = self.contentLabel {
            contentLabel.frame = CGRect(
                x: self.textSpaceLeft,
                y: self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height + 5.0,
                width: screenWidth - padding - self.textSpaceLeft - self.textSpaceRight,
                height: 0.0)
            contentLabel.sizeToFit()
            currentHeight = contentLabel.frame.origin.y + contentLabel.frame.size.height
        } else {
            currentHeight = self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height
        }
        currentHeight += padding
        
        
        // setting iconImageView
        // if icon is larger
        if self.iconImageView.frame.origin.y + self.iconImageView.frame.size.height + padding > currentHeight {
            currentHeight = self.iconImageView.frame.origin.y + self.iconImageView.frame.size.height + padding
        } else {
        // if icon is small, set it in center
            self.iconImageView.center = CGPoint(x: self.iconImageView.center.x, y: round(currentHeight / 2.0))
        }
        
        // setting button
        //self.button?.center = CGPoint(x: self.button.center.x, y: round(currentHeight / 2.0))
        
        // setting messagePosition
        if self.messagePosition == HUDMessageNotificationPostiion.top {
            var borderframe = self.borderView.frame
            borderframe.origin.y = currentHeight
            self.borderView.frame = borderframe
        }
        currentHeight += self.borderView.frame.size.height
        self.frame = CGRect(x: 0.0, y: self.frame.origin.y, width: self.frame.size.width, height: currentHeight)
        
        // setting button
        if let button = self.button {
            button.center = CGPoint(x: button.center.x, y: round(currentHeight / 2.0))
            button.frame = CGRect(
                x: self.frame.size.width - self.textSpaceRight,
                y: round((self.frame.size.height / 2.0) - button.frame.size.height / 2.0),
                width: button.frame.size.width,
                height: button.frame.size.height)
        }
        
        // setting background
        let backgroundFrame = CGRect(
            x: self.backgroundImageView.frame.origin.x,
            y: self.backgroundImageView.frame.origin.y,
            width: screenWidth,
            height: currentHeight)
        
        // TODO spring animation?
        
        // isNavBarHidden ?
        // isNavBarOpaque ?
        self.backgroundImageView.frame = backgroundFrame
        self.backgroundBlurView.frame = backgroundFrame
        
        return currentHeight
    }
    
    
    
}












