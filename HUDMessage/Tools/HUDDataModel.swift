//
//  HUDDataModel.swift
//  HUDMessage
//
//  Created by PSL on 1/18/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation

struct HUDDataModel {
    var title: String
    var content: String?
    var buttonTitle: String?
    
    init?(dict: Dictionary<String, Any>?) {
        guard let dict = dict,
            let title = dict[HUDDataKeys.title] as? String
            else {
            return nil
        }
        self.title = title
        self.content = dict[HUDDataKeys.content] as? String
        self.buttonTitle = dict[HUDDataKeys.buttonTitle] as? String
    }
}
