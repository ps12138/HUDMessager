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
    var dataSource: HUDDataSource
    var style: HUDStyle
    
    
    // MARK: - ViewController
    public weak var viewController: UIViewController?
    
   
    
    // MARK: - View
    internal var image: UIImage?
    internal var titleLabel: UILabel!
    internal var contentLabel: UILabel?
    internal var iconImageView: UIImageView!
    internal var button: UIButton?
    internal var borderView: UIView!
    internal var backgroundImageView: UIImageView!
    internal var backgroundBlurView: UIImageView!
    
    // MARK: - style
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
          superVC: UIViewController) {
        
        self.dataSource = dataSource
        self.viewController = superVC
        self.style = HUDStyle(dict: DefaultStyle)!
        super.init(frame: frame)
    }
    
    
    convenience init (
        frame: CGRect,
        dataSource: HUDDataSource,
        superVC: UIViewController,
        notificationType: HUDNotificationType,
        messagePosition: HUDMessageNotificationPostiion,
        canBeDismissedByUser: Bool,
        duration: CGFloat,
        callBack: @escaping ()->(),
        buttonCallBack: @escaping ()->()
    ) {
        self.init(frame: frame, dataSource: dataSource, superVC: superVC)
        
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
        
        // setting 
        
    }
}













