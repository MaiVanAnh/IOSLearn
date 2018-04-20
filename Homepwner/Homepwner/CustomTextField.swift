//
//  CustomTextField.swift
//  Homepwner
//
//  Created by Van Anh on 4/17/18.
//  Copyright © 2018 Van Anh. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        self.borderStyle = .line
        self.placeholder = "input your text or number"
        return true
    }
    override func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        self.borderStyle = .roundedRect
        return true
    }
}
