//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//
//  Function Code fillin by Kuan-Ping Chang

import UIKit
//import AVFoundation
import AudioToolbox

class ViewController: UIViewController{
    

   
    //var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
       PlaySound(sender)
    }
    
    func PlaySound(_ sender:UIButton){
        
        //This function via AVFoundation
        /*
         let url = Bundle.main.url(forResource: "note1", withExtension: "wav")!
         do{
         player = try AVAudioPlayer(contentsOf:url)
         guard let player = player else {return}
         player.prepareToPlay()
         player.play()
         }catch let error as Error{
         print(error)
         }
         */
        let sourceName:String = "note" + String(sender.tag)
        if let soundURL = Bundle.main.url(forResource:sourceName, withExtension:"wav")
        {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
            AudioServicesPlaySystemSound(mySound)
        }
    }
    

}

