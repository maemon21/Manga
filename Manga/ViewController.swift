//
//  ViewController.swift
//  Manga
//
//  Created by EMoshU on 2020/03/27.
//  Copyright © 2020 EMoshU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var countTimer: UILabel!
    @IBOutlet var runnerImageView: UIImageView!
    @IBOutlet var runButton: UIButton!
    
    var timer1 = Timer()
    var timer2 = Timer()
    var count = 0
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageArray = [UIImage(named: "dash0.png")!,UIImage(named: "dash1.png")!,UIImage(named: "dash2.png")!,UIImage(named: "dash3.png")!,UIImage(named: "dash4.png")!,UIImage(named: "dash5.png")!]
        
        runnerImageView.image = imageArray[0]
        
        
    }
    
    
    @IBAction func run(_ sender: Any) {
        runButton.isEnabled = false
        
        countTimer.text = "0"
        
        
        timer1 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            
            self.count = self.count + 1
            self.countTimer.text = String(self.count)
            
        })
        
        timer2 =  Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
                   
            self.runnerImageView.image = self.imageArray[self.count % 5]
                   
               })
        
    }
    
    @IBAction func stop(_ sender: Any) {
        runButton.isEnabled = true
        count = 0
        
        timer1.invalidate()
        timer2.invalidate()
        
    }
    
}

