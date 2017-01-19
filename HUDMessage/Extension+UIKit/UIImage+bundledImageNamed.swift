//
//  UIImage+bundledImageNamed.swift
//  HUDMessage
//
//  Created by PSL on 1/18/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    public class func bundledImageNamed(name: String, related: AnyClass) -> UIImage? {
        let bundle = Bundle.init(for: related)
        if let imagePath = bundle.path(forResource: name, ofType: nil) {
            return UIImage(contentsOfFile: imagePath)
        }
        return nil
    }

}
