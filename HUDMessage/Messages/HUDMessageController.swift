//
//  HUDMessage.swift
//  HUDMessage
//
//  Created by PSL on 1/25/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit


protocol HUDMessageViewProtocol: class {
    func messageLocationOfMessageView(messageView: HUDMessageView) -> CGFloat
    func customizeMessageView(messageView: HUDMessageView)
}



class HUDMessageController {
    
    
    // MARK: - delegate
    public weak var delegate: HUDMessageViewProtocol?
    
    
    
    // MARK: - singleton
    private init() { }
    static let shared = HUDMessageController()
    
    // MARK: - properties
    internal var messages = Dictionary<String, HUDMessageView>()
    
    
    
    // MARK: - Puclic methods
    
    /// show a notification message
    func show(
        withData data: HUDDataSource,
        config: HUDConfig,
        inViewController parentVC: UIViewController? = nil) {
        
    }
    
    /// show a notification message with detail
    func show(
        withData data: HUDDataSource,
        config: HUDConfig? = nil,
        inViewController parentVC: UIViewController? = nil,
        callBack: (()->())? = nil,
        buttonCallBack: (()->())? = nil) {
        
        let messageView = HUDMessageView(
            dataSource: data,
            config: config,
            superVC: parentVC,
            callBack: callBack,
            buttonCallBack: buttonCallBack)
        prepare(messageView: messageView)
    }
    
    // prepare to show
    func prepare(messageView: HUDMessageView) {
        let title = messageView.dataSource.title
        if messages[title] == nil {
            messages[title] = messageView
        }
        
        if isActiveNotify == false {
            fadeIn()
        }
    }
    
    
    /// fade in current
    func fadeIn() {
        
    }
    
    
    
    /// fade out the currently displayed notify, if another in the queue, next will be displayed automatically
    func dismissActiveNotify() -> Bool {
        
        return false
    }
    
    
    /// fade out the currently displayed notify, with completion block
    func dismissActiveNotify(completion: (()->())?) -> Bool {
    
        return false
    }
    
    
    /// set default viewController
    func set(defaultViewController vc: UIViewController) {
        
    }
    
    
    /// set a delegate to have full control 
    func set(delegateTo : AnyClass) {
        
    }
    
    
    var isActiveNotify: Bool {
        return true
    }
    
    func isNavigationBarHidden(navController: UINavigationController?) -> Bool {
        if let navCon = navController {
            return navCon.isNavigationBarHidden
        }
        return true
    }
    
}








