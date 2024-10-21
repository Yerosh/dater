//
//  SecondViewController.swift
//  dater(hw)
//
//  Created by Yernur Adilbek on 10/21/24.
//

import UIKit

class SecondViewController: ViewController {
    
    @IBOutlet weak var fromDateLabel: UILabel!
    @IBOutlet weak var toDateLabel: UILabel!
    @IBOutlet weak var runningDateLabel: UILabel!
    
    var receivedFromDate = Date()
    var receivedToDate = Date()
    
    var date = Date()
    
    var timer = Timer()
    
    var savedDate = Date()
    
    var isTimerRunning = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fromDateLabel.text = dateToString(receivedFromDate)
        toDateLabel.text = dateToString(receivedToDate)
        runningDateLabel.text = dateToString(receivedFromDate)
        
        savedDate = receivedFromDate
    }
    
    @objc func countTime() {
        receivedFromDate = Calendar.current.date(byAdding: .hour, value: 1, to: receivedFromDate)!
        runningDateLabel.text = dateToString(receivedFromDate)
        
        if receivedFromDate >= (receivedToDate  - 1){
            timer.invalidate()
            isTimerRunning = false
        }
    }
    
    @IBAction func start(_ sender: Any) {
        if isTimerRunning {return}
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    @IBAction func stop(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
    }
    
    @IBAction func restart(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
        receivedFromDate = savedDate
        runningDateLabel.text = dateToString(receivedFromDate)
    }
    
    func dateToString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy, EEE HH:mm"
        return formatter.string(from: date)
    }
    
    
}
