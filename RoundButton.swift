//
//  RoundButton.swift
//  Auto Layout Calculator
//
//  Created by Yi Jia on 5/22/18.
//  Copyright © 2018 Chloe Jia. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var roundButton:Bool = false{
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }

}
