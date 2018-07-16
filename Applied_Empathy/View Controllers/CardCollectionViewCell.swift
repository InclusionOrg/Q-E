//
//  CardCollectionViewCell.swift
//  Applied_Empathy
//
//  Created by Simone Grant on 6/18/18.
//  Copyright © 2018 Simone Grant. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var cardLabel: UILabel!
    
    var cardCategory: CardCategory? {
        didSet {
            self.updateUI()
        }
    }
    
    func kernLabel(_ string: String) -> String {
       return ""
    }
    
    func updateUI() {
        if let cardCategory = cardCategory {
            imageView.image = cardCategory.cardImage
            colorView.backgroundColor = cardCategory.color
            cardLabel.text
             = cardCategory.title
            cardLabel.addCharacterSpacing()
        } else {
            imageView.image = nil
            colorView.backgroundColor = nil
            cardLabel.text = nil
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.layer.cornerRadius = 5.0
        colorView.layer.cornerRadius = 5.0
        self.layer.cornerRadius = 5.0
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 5, height: 10)
        self.clipsToBounds = false
    }
}
