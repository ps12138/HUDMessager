//
//  HUDConfig.swift
//  HUDMessage
//
//  Created by PSL on 1/24/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

public struct HUDConfig {
    var notificationType: HUDNotificationType
    var duration: CGFloat
    var messageIsFullyDisplayed: Bool
    var messagePosition: HUDMessageNotificationPostiion

    
    init?(dict: Dictionary<String, Any>?) {
        guard
            let dict = dict,
            let notificationType = dict[HUDConfigKeys.notifyType] as? HUDNotificationType,
            let duration = dict[HUDConfigKeys.duration] as? CGFloat,
            let messageIsFullyDisplayed = dict[HUDConfigKeys.fullyDisplayed] as? Bool,
            let messagePosition = dict[HUDConfigKeys.messagePos] as? HUDMessageNotificationPostiion
            else {
                return nil
        }
        self.notificationType = notificationType
        self.duration = duration
        self.messageIsFullyDisplayed = messageIsFullyDisplayed
        self.messagePosition = messagePosition
    }
}
