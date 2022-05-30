//
//  LabelTapGestureRecognizer.swift
//  HousieNumberGenerator
//
//  Created by Arjit Agarwal on 06/11/21.
//

import Foundation

class LabelTapGestureRecognizer: UITapGestureRecognizer {

    let digit
    init(target: AnyObject, action: Selector, userModel: OtherUserModel) {
        self.userModel = userModel
        super.init(target: target, action: action)
    }
}
