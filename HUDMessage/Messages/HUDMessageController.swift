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
    
    
    internal struct Constants {
        static let messageDisplayTime: TimeInterval = 1.5
        static let messageExtraDisplayTimePerPixel: TimeInterval = 0.04
        static let messageAnimationDuration: TimeInterval = 1.0
        static let messageNotificationDurationAuto: TimeInterval = 3.0
        static let messageNotificationDurationEndless: TimeInterval = 60.0
    }
    
    
    
    
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
        
        
        // get new origin
        var toPoint = CGPoint()
        // if not in the bottom
        if currentView.messagePosition != .bottom {
            var navBarBottom: CGFloat = 0.0
            
            if let delegate = self.delegate {
                navBarBottom = delegate.messageLocationOfMessageView(messageView: currentView)
            }
            let newY = navBarBottom + verticalOffset + currentView.frame.size.height / 2.0
            toPoint.x = currentView.center.x
            toPoint.y = newY
        } else {
        // if in the bottom
            if let parentVC = currentView.viewController {
                var newY = parentVC.view.bounds.size.height - currentView.frame.size.height / 2.0
                if let currentNavCon = parentVC.navigationController,
                   currentNavCon.isToolbarHidden == false {
                    newY -= currentNavCon.toolbar.frame.height
                }
                toPoint.x = currentView.center.x
                toPoint.y = newY
            }
        }
        
        let animationBlock: () -> Void = {
            currentView.center = toPoint
        }
        let completionBlock :(Bool) -> Void = { result in
            currentView.messageIsFullyDisplayed = true
        }
        
        // if ios version > 7
        UIView.animate(withDuration: Constants.messageAnimationDuration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: [.curveEaseInOut, .beginFromCurrentState, .allowUserInteraction], animations: animationBlock, completion: completionBlock)
        
        // update total display time, including showing and animation
        if currentView.config.duration == Constants.messageNotificationDurationAuto {
            currentView.config.duration = Constants.messageNotificationDurationAuto + Constants.messageDisplayTime + Double(currentView.frame.size.height) * Constants.messageExtraDisplayTimePerPixel
        }
        // if currentView is not endless, we dismiss it after duration
        if currentView.config.duration < Constants.messageNotificationDurationEndless  {
            let dispatchTime = DispatchTime.now() + currentView.config.duration
            DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
                self.fadeOutNotification(messageView: currentView, comletion: nil)
            })
        }
        
    }
    
    
    
    /// TODO: fade out the currently displayed notify, if another in the queue, next will be displayed automatically
    func dismissActiveNotify() -> Bool {
        
        return false
    }
    
    
    /// TODO: fade out the currently displayed notify, with completion block
    func dismissActiveNotify(completion: (()->())?) -> Bool {
    
        return false
    }
    
    
    /// TODO: set default viewController
    func set(defaultViewController vc: UIViewController) {
        
    }
    
    
    /// TODO: set a delegate to have full control
    func set(delegateTo : AnyClass) {
        
    }
    
    /// TODO: check is active notify or not
    var isActiveNotify: Bool {
        return true
    }
    
    
    
    // MARK: - internal methods
    
    /// return current NavigationController is BarHidden
    func isNavigationBarHidden(navController: UINavigationController?) -> Bool {
        if let navCon = navController {
            return navCon.isNavigationBarHidden
        }
        return true
    }
    
    
    func fadeOutNotification(messageView: HUDMessageView, comletion: (()->Void)?) {
        
    }
    
    
}








