//
//  SwipeViewController.swift
//  Applied_Empathy
//
//  Created by Simone Grant on 6/19/18.
//  Copyright © 2018 Simone Grant. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController, ModalViewControllerDelegate {
    
    @IBOutlet weak var reloadBtn: UIButton!
    @IBOutlet weak var infoBtn: UIButton!
    @IBOutlet weak var timerBtn: UIButton!
    var cardStack: [String]!
    var category: String!
    var newView: CardView!
    var archetypeDetail: [String]!
    var infoToPass: (String,String,String)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.generateCards()
        
        }
        infoToPass = (category, archetypeDetail[0], archetypeDetail[1])
        applyButtonUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        UINavigationBar.appearance().barTintColor = UIColor.white
    }
    
    func applyButtonUI() {
        timerBtn.layer.cornerRadius = timerBtn.frame.size.width/2
        timerBtn.clipsToBounds = true
        infoBtn.layer.cornerRadius = infoBtn.frame.size.width/2
        infoBtn.clipsToBounds = true
        reloadBtn.layer.cornerRadius = reloadBtn.frame.size.width/2
        reloadBtn.clipsToBounds = true
    }
    
    func generateCards() {
        //create deck
        var counter: CGFloat = 0
        for x in 0..<cardStack.count {
            newView = CardView()
            let frameSize: CGPoint = CGPoint(x: (UIScreen.main.bounds.size.width/2) * 0.25,y: (UIScreen.main.bounds.size.height/2) * 0.45)
            let heightOffset = (frameSize.y + counter) - 50
            newView = CardView(frame: CGRect(x: frameSize.x, y: heightOffset, width: 280, height: 450))
            newView.center.x = self.view.center.x
            newView.layer.cornerRadius = 8
            newView.layer.shadowOffset = CGSize(width: 7, height: 7)
            newView.layer.shadowRadius = 3
            newView.layer.shadowOpacity = 0.3
            newView.mainLabel.text = "\(cardStack[x])"
            newView.cardCategory.text = " \(category!) "
            newView.cardCategory.addCharacterSpacing()
            let pan = UIPanGestureRecognizer(target: self, action: #selector(swipeCard(_:)))
            let tap = UITapGestureRecognizer(target: self, action: #selector(wasDoubleTapped(_:)))
            tap.numberOfTapsRequired = 2
            newView.addGestureRecognizer(pan)
            newView.addGestureRecognizer(tap)
            self.view.addSubview(newView)
            counter -= 5
        }
    }
    
    //Add double tap gesture
    @objc func wasDoubleTapped(_ sender: UITapGestureRecognizer) {
        let card = sender.view!
        if sender.state == UIGestureRecognizerState.ended {
            UIView.animate(withDuration: 0.3, animations: {
                card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
            })
            card.alpha = 0
        }
    }
    
    @objc func swipeCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        let divisor = (view.frame.width / 2) / 0.61
        let scale = min(100/abs(xFromCenter), 1)
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        // 100/2 = 50/0.61 = 81.967
        card.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor).scaledBy(x: scale, y: scale)
        //if you move the card and let go it resets back to the center or goes off screen
        if sender.state == UIGestureRecognizerState.ended {
            //go off screen
            if card.center.x < 75 {
                //move off to the left side
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    //make invisible
                    card.alpha = 0
                })
                return
            } else if card.center.x > (view.frame.width - 75) {
                //move off to the right side
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0
                })
                return
            }
            
            //go back to center
            UIView.animate(withDuration: 0.2) {
                card.center = self.view.center
            }
            resetCard(card)
        }
    }
    
    @IBAction func reset(_ sender: UIButton) {
        self.generateCards()
    }
    
    func resetCard(_ card: UIView) {
        UIView.animate(withDuration: 0.2) {
            card.center = self.view.center
            card.alpha = 1
            //reset transform
            card.transform = CGAffineTransform.identity
        }
    }
    
    @IBAction func presentArchetypeInfo(_ sender: UIButton) {
        self.definesPresentationContext = true
        self.providesPresentationContextTransitionStyle = true
        
    }

    func closeModalView() {
        print("modal closed")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowModalView" {
            if let vc = segue.destination as? InfoModalViewController {
                vc.delegate = self
                vc.modalPresentationStyle = .pageSheet
                vc.details = infoToPass
            }
        }
    }
}


