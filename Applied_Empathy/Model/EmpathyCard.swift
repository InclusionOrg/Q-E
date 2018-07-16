//
//  EmpathyCard.swift
//  Applied_Empathy
//
//  Created by Simone Grant on 6/18/18.
//  Copyright © 2018 Simone Grant. All rights reserved.
//

import UIKit

class CardCategory {
    var title = ""
    var cardImage: UIImage!
    var color: UIColor!
    
    init(title: String, cardImage: UIImage, color: UIColor) {
        self.title = title
        self.cardImage = cardImage
        self.color = color
    }
    
    static func fetchCards() -> [CardCategory] {
        return [
            CardCategory(title: EmpathyType.alchemist.uppercased(), cardImage: #imageLiteral(resourceName: "alchemist"), color: UIColor(red: 20/255.0, green: 20/255.0, blue: 54/255.0, alpha: 0.9)),
            CardCategory(title: EmpathyType.confidant.uppercased(), cardImage: #imageLiteral(resourceName: "confidant"), color: UIColor(red: 239/255.0, green: 183/255.0, blue: 169/255.0, alpha: 0.9)),
            CardCategory(title: EmpathyType.convener.uppercased(), cardImage: #imageLiteral(resourceName: "convener"), color: UIColor(red: 20/255.0, green: 20/255.0, blue: 54/255.0, alpha: 0.9)),
            CardCategory(title: EmpathyType.cultivator.uppercased(), cardImage: #imageLiteral(resourceName: "cultivator"), color: UIColor(red: 239/255.0, green: 183/255.0, blue: 169/255.0, alpha: 0.9)),
            CardCategory(title: EmpathyType.inquirer.uppercased(), cardImage: #imageLiteral(resourceName: "inquirer"), color: UIColor(red: 20/255.0, green: 20/255.0, blue: 54/255.0, alpha: 0.9)),
            CardCategory(title: EmpathyType.sage.uppercased(), cardImage: #imageLiteral(resourceName: "sage"), color: UIColor(red: 239/255.0, green: 183/255.0, blue: 169/255.0, alpha: 0.9)),
            CardCategory(title: EmpathyType.seeker.uppercased(), cardImage: #imageLiteral(resourceName: "seeker"), color: UIColor(red: 20/255.0, green: 20/255.0, blue: 54/255.0, alpha: 0.9))
        ]
    }
    
}



