//
//  ViewController.swift
//  Dicee
//
//  Created by Yu-Ting Chang on 4/15/18.
//  Copyright © 2018 Kuan-Ping Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    @IBOutlet weak var scoreView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rollButtonView(_ sender: UIButton) {
       
        updateView()
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?){
        
        updateView()
        
    }
    
    func updateView(){
        
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        //alt way no array needed
        /*
         let diceName1: String = "dice" + String(randomDiceIndex1 + 1)
         let diceName2: String = "dice" + String(randomDiceIndex2 + 1)
         diceImageView1.image = UIImage(named:diceName1)
         diceImageView2.image = UIImage(named:diceName2)
         */
        diceImageView1.image = UIImage(named:diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named:diceArray[randomDiceIndex2])
        scoreView.text = String(randomDiceIndex1 + randomDiceIndex2 + 2)
    }
}

