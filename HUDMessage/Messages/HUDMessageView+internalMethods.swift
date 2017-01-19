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
    internal func set(contentLabelWith config: ConfigModel) -> UILabel {
        let label = UILabel()
        label.text = subtitle
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
    internal func updateHeight() {
        guard let screenWidth = self.viewController?.view.bounds.size.width else {
            return
        }
        let padding = self.padding
        
        // setting size of titleLabel
        self.titleLabel.frame = CGRect(x: self.textSpaceLeft, y: padding, width: screenWidth - padding - self.textSpaceLeft - self.textSpaceRight, height: 0.0)
        titleLabel.sizeToFit()
        
        // setting size of contentLabel
        self.contentLabel.frame = CGRect(x: self.textSpaceLeft, y: self.titleLabel.frame.origin.y + titleLabel.frame.size.height + 5.0, width: screenWidth - padding - self.textSpaceLeft - self.textSpaceRight, height: 0.0)
        contentLabel.sizeToFit()
        
    }
    
}












