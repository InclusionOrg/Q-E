//
//  Label+Extension.swift
//  Applied_Empathy
//
//  Created by Simone Grant on 7/2/18.
//  Copyright © 2018 Simone Grant. All rights reserved.
//

import UIKit

extension UILabel {
    func addCharacterSpacing() {
        if let labelText = text, labelText.count > 0 {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(NSAttributedStringKey.kern, value: 5, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}

//add extension for kerning
@IBDesignable
class KerningLabel: UILabel {
    
    @IBInspectable var kerning: CGFloat = 0.0 {
        didSet {
            if attributedText?.length == nil { return }
            
            let attrStr = NSMutableAttributedString(attributedString: attributedText!)
            let range = NSMakeRange(0, attributedText!.length)
            attrStr.addAttributes([NSAttributedStringKey.kern: kerning], range: range)
            attributedText = attrStr
        }
    }
}
