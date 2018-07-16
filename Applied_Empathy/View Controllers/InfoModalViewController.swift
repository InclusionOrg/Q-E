//
//  InfoModalViewController.swift
//  Applied_Empathy
//
//  Created by Simone Grant on 6/28/18.
//  Copyright © 2018 Simone Grant. All rights reserved.
//

import UIKit

protocol ModalViewControllerDelegate {
    func closeModalView()
}

class InfoModalViewController: UIViewController {

    @IBOutlet weak var purchaseBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var blurb: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var exitButton: UIButton!
    var delegate: ModalViewControllerDelegate?
    var details: (String, String, String)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupModal()
    }
    
    func setupModal() {
        categoryLabel.text = details.0
        taglineLabel.text = details.1
        blurb.text = details.2
        containerView.layer.cornerRadius = 8
        //change purchaseLabel to a button and link out to subrosa
        purchaseBtn.addTarget(self, action: #selector(didTapToOrder(_:)), for: .touchUpInside)
    }
    
    @IBAction func didTapToOrder(_ sender: UIButton) {
        guard let url = URL(string: "https://www.questionsandempathy.com") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    @IBAction func exitButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        delegate?.closeModalView()
    }
    
}
