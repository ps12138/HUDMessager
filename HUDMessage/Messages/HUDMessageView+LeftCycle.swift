//
//  HUDMessageView_LeftCycle.swift
//  HUDMessage
//
//  Created by PSL on 1/24/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation


// MARK: - Life Cycle
extension HUDMessageView {
    
    ///
    override public func layoutSubviews() {
        super.layoutSubviews()
        let curHeight = self.updateHeight()
        print("Message.V: update height = \(curHeight)")
    }
    
    /// TODO: - fadeOut
    
    /// TODO: - didMoveToWindow
    
    /// TODO: - buttonTapped
    
    /// TODO: - gestureRecognizer
}
