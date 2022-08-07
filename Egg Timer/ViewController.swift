//
//  ViewController.swift
//  Egg Timer
//
//  Created by Aditya Virbhadra Vyavahare on 04/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var OnScreenTextLabel: UILabel!
    @IBOutlet weak var progressBarView: UIProgressView!
    
    /*let softTime = 2
    let mediumTime = 3
    let hardTime = 4*/
    let eggTimes: [String:Int] = ["Soft": 10, "Medium": 15, "Hard": 20]     //dictionary
    
    var hardness: String = "null"
    var counter = 0
    var timer = Timer()
    var totalTime = 0
    var progressPercentage: Float = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
            
        timer.invalidate()
        progressBarView.progress = 0.0
        progressPercentage = 0
        
        hardness = sender.title(for: .normal)!
        totalTime = eggTimes[hardness]!

        // start the timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    // called every time interval from the timer
    @objc func timerAction() {
        if(counter < totalTime) {
            OnScreenTextLabel.text = "Egg's are being boiled to be '\(hardness) cored'!                           wait & wait & wait..."
            print("\(counter)")
            counter += 1
            
            progressPercentage = Float(counter)/Float(totalTime)
            print(progressPercentage)
            progressBarView.progress = progressPercentage
        } else {
            OnScreenTextLabel.text = "Your '\(hardness) cored' egg's are ready!"
            progressPercentage = 0
            totalTime = 0
            counter = 0
            timer.invalidate()
        }
    }
}

