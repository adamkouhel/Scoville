//
//  TimerViewController.swift
//  Scoville
//
//  Created by Adam Kouhel on 12/15/17.
//  Copyright © 2017 AdamKouhel. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    
    @IBOutlet weak var lblCountdown: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var btnPause: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    
    
    var seconds = 60
    var timer = Timer()
    
    var isTimerRunning = false
    var resumeTapped = false
    
    @IBAction func btnStart(_ sender: Any) {
        if isTimerRunning == false {
            runTimer()
            self.btnStart.isEnabled = false
        }
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(TimerViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
        btnPause.isEnabled = true
    }
        
    
    
    @IBAction func btnPause(_ sender: Any) {
        if self.resumeTapped == false {
            timer.invalidate()
            isTimerRunning = false
            self.resumeTapped = true
            self.btnPause.setTitle("Resume",for: .normal)
        } else {
            runTimer()
            self.resumeTapped = false
            isTimerRunning = true
            self.btnPause.setTitle("Pause",for: .normal)
        }
    }
    
    
    @IBAction func btnReset(_ sender: Any) {
        timer.invalidate()
        seconds = 60
        lblCountdown.text = timeString(time: TimeInterval(seconds))
        isTimerRunning = false
        btnPause.isEnabled = false
        btnStart.isEnabled = true
    }
    
    func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            //Send alert to indicate time's up.
        } else {
            seconds -= 1
            lblCountdown.text = timeString(time: TimeInterval(seconds))
            lblCountdown.text = String(seconds)
            //            labelButton.setTitle(timeString(time: TimeInterval(seconds)), for: UIControlState.normal)
        }
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    //MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        btnPause.isEnabled = false
    }



}
