//
//  MessageView.swift
//  HUDMessage
//
//  Created by PSL on 1/18/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import UIKit


// MARK: - Properties
public class HUDMessageView: UIView {
    
    // MARK: - Model
    public var dataSource: HUDDataSource
    public var style: HUDStyle
    public var config: HUDConfig
    
    // MARK: - Controller
    public weak var viewController: UIViewController?
    internal let notificationManager = HUDNotificationManager()
    
    // MARK: - Views
    internal var image: UIImage?
    internal var titleLabel: UILabel!
    internal var contentLabel: UILabel?
    internal var iconImageView: UIImageView!
    internal var button: UIButton?
    internal var borderView: UIView!
    internal var backgroundImageView: UIImageView!
    internal var backgroundBlurView: UIImageView!
    
    // MARK: - View styles
    public var titleFont: UIFont?
    public var titleTextColor: UIColor?
    public var contentFont: UIFont?
    public var contentTextColor: UIColor?
    public var messageIcon: UIImage?
    public var errorIcon: UIImage?
    public var successIcon: UIImage?
    public var warningIcon: UIImage?
    
    
    
    // MARK: - config
    //internal var canBeDismissedByUser: Bool
    internal var notificationType: HUDNotificationType = .message
    internal var duration: CGFloat = 0.5
    internal var messageIsFullyDisplayed: Bool = false
    internal var messagePosition: HUDMessageNotificationPostiion = .top
    
    internal var textSpaceLeft: CGFloat = 0.0
    internal var textSpaceRight: CGFloat = 0.0
    
    internal var callBack: (()->())?
    internal var buttonCallBack: (()->())?
    
    
    // MARK: - calculate var
    internal var padding: CGFloat {
        return (messagePosition == .topCoverNavBar ? Constants.miniPadding + 10 : Constants.miniPadding)
    }
    
    
    internal struct Constants {
        static let miniPadding: CGFloat = 15.0
        static let bgImage = "hehe.jpg"
    }
    
    
    
    // MARK: - init
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init (frame: CGRect,
          dataSource: HUDDataSource,
          style: HUDStyle? = nil,
          config: HUDConfig? = nil,
          superVC: UIViewController?) {
        
        self.dataSource = dataSource
        self.style = style ?? HUDStyle(dict: DefaultStyle)!
        self.config = config ?? HUDConfig(dict: DefaultConfig)!
        
        self.viewController = superVC
        super.init(frame: frame)
    }
    
    
    convenience init (
        dataSource: HUDDataSource,
        config: HUDConfig? = nil,
        superVC: UIViewController? = nil,
        callBack: (()->())? = nil,
        buttonCallBack: (()->())? = nil
    ) {
        
        // setting init
        let screenFrame = UIApplication.shared.windows[0].bounds
        self.init(frame: screenFrame, dataSource: dataSource, config: config, superVC: superVC)
        
        // setting properties
        self.callBack = callBack
        self.buttonCallBack = buttonCallBack
        
        // setting background
        set(blurStyle: true)
        
        // setting titleLabel
        titleLabel = set(titleLabelWith: style)
        
        // setting contentLabel
        contentLabel = set(contentLabelWith: style)
        
        // setting image
        self.image = UIImage.bundledImageNamed(name: style.imageName, related: type(of:self))
        // setting textSpace
        self.textSpaceLeft = padding * 2
        if let image = self.image {
            self.textSpaceLeft += image.size.width + 2 * padding
            iconImageView = set(iconImageWith: image)
        }
        
        // setting border
        set(borderWith: style)
        
        // setting button
        
        var screenSize = UIApplication.shared.windows[0].bounds.size

        if let superVC = superVC {
            screenSize = superVC.view.bounds.size
        }
        
        // update frame by content
        // this call also takes care of positioning the labels
        let actualHeight = self.updateHeight()
        var topPosition = -actualHeight
        
    
        if self.messagePosition == .bottom {
            topPosition = screenSize.height
        }
        
        self.frame = CGRect(x: 0.0, y: topPosition, width: screenSize.width, height: actualHeight)
        
        if self.messagePosition == .top {
            self.autoresizingMask = UIViewAutoresizing.flexibleWidth
        } else {
            self.autoresizingMask =
                [UIViewAutoresizing.flexibleWidth,
                UIViewAutoresizing.flexibleTopMargin,
                UIViewAutoresizing.flexibleBottomMargin]
        }
        
        
    }
}













