//
//  HUDMessageView+PublicMethods.swift
//  HUDMessage
//
//  Created by PSL on 1/18/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit


// MARK: - PublicMethods
extension HUDMessageView {
    ///
    func updateCurrentIcon() {
        switch notificationType {
        case .message:
            if let image = messageIcon {
                self.iconImageView?.image = image
            }
        case .error:
            if let image = errorIcon {
                self.iconImageView?.image = image
            }
        case .success:
            if let image = successIcon {
                self.iconImageView?.image = image
            }
        case .warning:
            if let image = warningIcon {
                self.iconImageView?.image = image
            }
        default: break
        }
        
        guard let curImage = self.iconImageView?.image else {
            return
        }
        
        self.iconImageView.frame = CGRect(x: padding * 2, y: padding, width: curImage.size.width, height: curImage.size.height)
    }
    
    
    
    
}
