//
//  CardsViewController.swift
//  Applied_Empathy
//
//  Created by Simone Grant on 6/18/18.
//  Copyright © 2018 Simone Grant. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var empathy: Empathy!
    let cards = CardCategory.fetchCards()
    var selectedCardStack = [String]()
    var cardCategory = String()
    let cellScaling: CGFloat = 0.6
    var dict = [String: [String]]()
    var infoCategory: [String]!
    var archDict = [String: [String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        loadUsingDecoder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        //hide navigation bar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //show navigation bar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setupCollectionView() {
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScaling)
        let cellHeight = floor(screenSize.height * cellScaling)
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = (view.bounds.height - cellHeight) / 2.0
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView?.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func loadUsingDecoder() {
        guard let path = Bundle.main.path(forResource: "empathy", ofType: "json") else { return }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: [])
            empathy = try JSONDecoder().decode(Empathy.self, from: data)
          
            dict = [
                EmpathyType.alchemist: empathy.categories.alchemistCards,
                EmpathyType.confidant: empathy.categories.confidantCards,
                EmpathyType.convener: empathy.categories.convenerCards,
                EmpathyType.cultivator: empathy.categories.cultivatorCards,
                EmpathyType.inquirer: empathy.categories.inquirerCards,
                EmpathyType.sage: empathy.categories.sageCards,
                EmpathyType.seeker: empathy.categories.seekerCards
            ]
            
            archDict = [
                EmpathyType.alchemist: empathy.archetypes.alchemist,
                EmpathyType.confidant: empathy.archetypes.confidant,
                EmpathyType.convener: empathy.archetypes.convener,
                EmpathyType.cultivator: empathy.archetypes.cultivator,
                EmpathyType.inquirer: empathy.archetypes.inquirer,
                EmpathyType.sage: empathy.archetypes.sage,
                EmpathyType.seeker: empathy.archetypes.seeker
            ]
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getIndexPath(_ indexPath: IndexPath) {
        for (key, value) in dict {
            if key == cards[indexPath.item].title.lowercased() {
                cardCategory = key.uppercased()
                selectedCardStack = value
                if archDict.keys.contains(key) {
                    infoCategory = archDict[key]
                }
            }
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let selectedCell = sender as? UICollectionViewCell {
            if segue.identifier == "cardSegue" {
                let category = segue.destination as! SwipeViewController
                let cellPath = self.collectionView.indexPath(for: selectedCell)
                self.getIndexPath(cellPath!)
                category.cardStack = self.selectedCardStack
                category.category = self.cardCategory
                category.archetypeDetail = infoCategory
            }
        }
    }
}




