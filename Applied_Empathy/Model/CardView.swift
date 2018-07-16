//
//  CustomView.swift
//  Applied_Empathy
//
//  Created by Simone Grant on 6/20/18.
//  Copyright © 2018 Simone Grant. All rights reserved.
//

import UIKit
@IBDesignable

class CardView: UIView {

    @IBOutlet var mainView: UIView!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var cardCategory: UILabel!
    
    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("CardView", owner: self, options: nil)
        guard let content = mainView else { return }
        content.frame = self.bounds
        content.layer.cornerRadius = 8
        content.layer.shadowOffset = CGSize(width: 7, height: 7)
        content.layer.shadowRadius = 3
        content.layer.shadowOpacity = 0.3
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowOffset = CGSize(width: 7, height: 7)
        contentView.layer.shadowRadius = 3
        contentView.layer.shadowOpacity = 0.3
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(content)
    }
}
