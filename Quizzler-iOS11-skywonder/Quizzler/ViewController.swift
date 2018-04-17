//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//
//  Codes Below Filled by Kuan-Ping Chang

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer:Bool = false
    var score:Int = 0
    var pos:Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestions.list[0]
        print(allQuestions.list.count)
        questionLabel.text = firstQuestion.questionText
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if(sender.tag == 1)
        {
            print("pick true")
            pickedAnswer = true;
        }
        if(sender.tag == 2)
        {
            print("pick false")
            pickedAnswer = false;
        }
        checkAnswer()
        nextQuestion()
        updateUI()
        
    }
    
    
    func updateUI() {
       progressLabel.text = String(pos + 1) + "/" + String(allQuestions.list.count)
       progressBar.frame.size.width = (view.frame.size.width/13) * CGFloat(pos+1)
    }
   

    func nextQuestion() {
        if(pos < allQuestions.list.count - 1){
            pos += 1
            questionLabel.text = allQuestions.list[pos].questionText
        }
        else{
            let alert = UIAlertController(title: "Completed", message: "You've finished all the questions", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style:.default, handler:
            {
                (UIAlertAction) in self.startOver()
            })
            
            alert.addAction(restartAction)
            present(alert, animated:true, completion:nil)
        }
    }
    
    
    func checkAnswer() {
        if (pickedAnswer == allQuestions.list[pos].answer){
            print("You got it right!")
            ProgressHUD.showSuccess("Correct")
            score += 1
            scoreLabel.text = "Score: " + String(score)
        }
        else
        {
            print("You got it wrong!")
            ProgressHUD.showSuccess("False")
            scoreLabel.text = "Score: " + String(score)
        }
    }
    
    
    func startOver() {
        pos = 0
        score = 0
        scoreLabel.text = "Score: " + String(score)
        questionLabel.text = allQuestions.list[pos].questionText
        progressLabel.text = String(pos + 1) + "/" + String(allQuestions.list.count)
        progressBar.frame.size.width = (view.frame.size.width/13) * CGFloat(pos+1)
    }
    

    
}
