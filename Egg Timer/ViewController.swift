//
//  ViewController.swift
//  Egg Timer
//
//  Created by Aditya Virbhadra Vyavahare on 04/08/22.
//

import UIKit

class ViewController: UIViewController {

    /*let softTime = 2
    let mediumTime = 3
    let hardTime = 4*/
    let eggTimes: [String:Int] = ["Soft": 2, "Medium": 3, "Hard": 4]
    
    var hardness: String = "null"
    var counter = 10
    var timer = Timer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
            
        timer.invalidate()
        hardness = sender.title(for: .normal)!
        //print(eggTimes[hardness]!)

        // start the timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    // called every time interval from the timer
    @objc func timerAction() {
        counter -= 1
        if(counter == 0) {
            //counter = 0
            timer.invalidate()
        }
        print("\(counter)")
    }
    
}

