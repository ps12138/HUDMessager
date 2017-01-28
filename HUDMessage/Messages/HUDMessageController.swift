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
    internal var messages = Array<HUDMessageView>()
    
    
    
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
        for view in self.messages {
            // avoid duplication
            if title == view.dataSource.title {
                return
            }
        }
        
        if isActiveNotify == false {
            fadeIn()
        }
    }
    
    
    /// fade in current
    func fadeIn() {
        // if no messages
        if self.messages.count == 0 {
            return
        }
        
        var currentView = self.messages[0]
        var verticalOffset: CGFloat = 0.0
        // if messageView shouldnot cover navBar
        func addStatusBarHeightToVerticalOffset() {
            if currentView.config.messagePosition != .topCoverNavBar {
                let statusBarSize = UIApplication.shared.statusBarFrame.size
                verticalOffset += min(statusBarSize.height, statusBarSize.width)
            }
        }
        
        // if currentView.parentVC is NavCon or embedded in NavCon
        if let currentNavCon = (currentView.viewController as? UINavigationController) ?? currentView.viewController?.navigationController {
            
            // hasNavBar, uncover NavBar
            if self.isNavigationBarHidden(navController: currentNavCon) == false && currentView.config.messagePosition != .topCoverNavBar{
                currentNavCon.view.insertSubview(currentView, belowSubview: currentNavCon.navigationBar)
                verticalOffset = currentNavCon.navigationBar.bounds.size.height
                addStatusBarHeightToVerticalOffset()
            } else {
                currentView.viewController?.view.addSubview(currentView)
                addStatusBarHeightToVerticalOffset()
            }
        } else {
            currentView.viewController?.view.addSubview(currentView)
            addStatusBarHeightToVerticalOffset()
        }
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








