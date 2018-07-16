//
//  MainTableViewController.swift
//  Applied_Empathy
//
//  Created by Simone Grant on 6/8/18.
//  Copyright © 2018 Simone Grant. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var tableViewData = [cellData]()
    var dict = [String:Any]()
    var empathy: Empathy!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUsingDecoder()
    }
    
    func loadUsingDecoder() {
        guard let path = Bundle.main.path(forResource: "empathy", ofType: "json") else { return }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: [])
            empathy = try JSONDecoder().decode(Empathy.self, from: data)
            printEmpathyData()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func printEmpathyData() {
        let categories = empathy.archetypes
        let alchemist = categories.alchemist
        let sage = categories.sage
        let convener = categories.convener
        let inquirer = categories.inquirer
        let confidant = categories.confidant
        let cultivator = categories.cultivator
        let seeker = categories.seeker
        
        dict = ["Alchemist": alchemist, "Confidant": confidant, "Convener": convener, "Cultivator": cultivator, "Inquirer": inquirer, "Sage": sage, "Seeker": seeker]
        
        //Load tableviewdata
        for (key, value) in dict {
            print(key, value)
            tableViewData.append(cellData(opened: false, title: key, sectionData: value as! [String]))
        }
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MainTableViewCell else { return UITableViewCell() }
            cell.categoryLabel.text = tableViewData[indexPath.section].title
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MainTableViewCell else { return UITableViewCell() }
            cell.categoryLabel.text = tableViewData[indexPath.section].sectionData[indexPath.row]
            if tableViewData[indexPath.section].sectionData[indexPath.row] != tableViewData[indexPath.section].title {
                cell.categoryLabel.font = UIFont(name: "Avenir", size: 20)
            }
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableViewData[indexPath.section].opened == true {
            tableViewData[indexPath.section].opened = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        } else {
            tableViewData[indexPath.section].opened = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
    }
    
}
