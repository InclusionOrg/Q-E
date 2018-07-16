//
//  SetTimeViewController.swift
//  Applied_Empathy
//
//  Created by Simone Grant on 6/30/18.
//  Copyright © 2018 Simone Grant. All rights reserved.
//

import UIKit

class SetTimeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var setTimerButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    var times = ["10 minutes", "5 minutes", "1 minute"]
    var selectedRow = "10:00"
    
    //Timer Container View
    var seconds = 60
    var minutes = 0
    var timer = Timer()
    var timerIsRunning = true
    var resumedTapped = false
    @objc var chosenTime: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerView.isHidden = true
        pickerView.delegate = self
        pickerView.dataSource = self
        
        setTimerButton.layer.cornerRadius = 8
        cancelButton.layer.cornerRadius = 8
        containerView.layer.cornerRadius = 8
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        containerView.frame.size.height = view.frame.size.height * 0.75
    }

    @IBAction func cancelTimer(_ sender: UIButton) {
        timerView.isHidden = true
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func setTimer(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.containerView.isHidden = true
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
        }
        
        self.timerView.center.y = view.frame.size.height + 170
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseIn, animations: {
            self.timerView.isHidden = false
            self.timerView.center.y = self.view.frame.size.height - 83
        })
        setupTimerView()
        runTimer()
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return times.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return times[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "Avenir", size: 20)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = times[row]
        return pickerLabel!
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch  row {
        case 0:
            selectedRow = "10:00"
        case 1:
            selectedRow = "5:00"
        case 2:
            selectedRow = "1:00"
        default:
            selectedRow = "5:00"
        }
        timerLabel.text = selectedRow
    }
   

}
