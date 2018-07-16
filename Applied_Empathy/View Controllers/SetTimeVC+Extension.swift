//
//  SetTimeVC+Extension.swift
//  Applied_Empathy
//
//  Created by Simone Grant on 7/2/18.
//  Copyright © 2018 Simone Grant. All rights reserved.
//

import UIKit

extension SetTimeViewController {
    func setupTimerView() {
        timerLabel.text = selectedRow
        timerView.layer.cornerRadius = 8
        resetButton.layer.cornerRadius = 8
        dismissButton.layer.cornerRadius = 8
        pauseButton.layer.cornerRadius = 8
    }
    
    func runTimer() {
        switch selectedRow {
        case "10:00":
            minutes = 10
        case "5:00":
            minutes = 5
        case "1:00":
            minutes = 1
        default:
            minutes = 5
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        let formatter = NumberFormatter()
        formatter.minimumIntegerDigits = 2
        if seconds < 1 && minutes < 1 {
            timer.invalidate()
            //Send alert to indicate time's up.
            timerLabel.textColor = UIColor.red
        } else {
            seconds -= 1
            switch timerLabel.text {
            case "10:00"?:
                minutes -= 1
                seconds = 59
                timerLabel.text = "\(minutes):\(formatter.string(from: NSNumber(value: seconds))!)"
            case "9:00"?:
                minutes -= 1
                seconds = 59
                timerLabel.text = "\(minutes):\(formatter.string(from: NSNumber(value: seconds))!)"
            case "8:00"?:
                minutes -= 1
                seconds = 59
                timerLabel.text = "\(minutes):\(formatter.string(from: NSNumber(value: seconds))!)"
            case "7:00"?:
                minutes -= 1
                seconds = 59
                timerLabel.text = "\(minutes):\(formatter.string(from: NSNumber(value: seconds))!)"
            case "6:00"?:
                minutes -= 1
                seconds = 59
                timerLabel.text = "\(minutes):\(formatter.string(from: NSNumber(value: seconds))!)"
            case "5:00"?:
                minutes -= 1
                seconds = 59
                timerLabel.text = "\(minutes):\(formatter.string(from: NSNumber(value: seconds))!)"
            case "4:00"?:
                minutes -= 1
                seconds = 59
                timerLabel.text = "\(minutes):\(formatter.string(from: NSNumber(value: seconds))!)"
            case "3:00"?:
                minutes -= 1
                seconds = 59
                timerLabel.text = "\(minutes):\(formatter.string(from: NSNumber(value: seconds))!)"
            case "2:00"?:
                minutes -= 1
                seconds = 59
                timerLabel.text = "\(minutes):\(formatter.string(from: NSNumber(value: seconds))!)"
            case "1:00"?:
                minutes -= 1
                seconds = 59
                timerLabel.text = "\(minutes):\(formatter.string(from: NSNumber(value: seconds))!)"
            default:
                timerLabel.text = "\(minutes):\(formatter.string(from: NSNumber(value: seconds))!)"
            }
            
        }
    }
    
    @IBAction func dismissTimer(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        if self.resumedTapped == false {
            timer.invalidate()
            timerIsRunning = false
            self.resumedTapped = true
            self.pauseButton.setTitle("RESUME", for: .normal)
        } else {
            timerIsRunning = true
            self.resumedTapped = false
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
            self.pauseButton.setTitle("PAUSE", for: .normal)
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timerLabel.text = selectedRow
        switch selectedRow {
        case "10:00":
            minutes = 10
        case "5:00":
            minutes = 5
        case "1:00":
            minutes = 1
        default:
            minutes = 5
        }
    }
    
    func timeLeft(time: TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        let formatter = NumberFormatter()
        formatter.minimumIntegerDigits = 2
        timerLabel.text = "\(minutes):\(String(describing: formatter.string(from: NSNumber(value: seconds))))"
        
        return timerLabel.text!
    }

}
