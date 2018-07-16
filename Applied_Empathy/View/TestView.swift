//
//  TestView.swift
//  Applied_Empathy
//
//  Created by Simone Grant on 6/23/18.
//  Copyright © 2018 Simone Grant. All rights reserved.
//

import UIKit

class TestView: UIView {

    @IBOutlet weak var testLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        let bundle = Bundle.init(for: type(of: self))
        let nib = UINib(nibName: "TestView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(view)
//        return view
    }


}
