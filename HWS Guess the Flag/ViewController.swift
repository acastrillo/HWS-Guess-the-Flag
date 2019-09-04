//
//  ViewController.swift
//  HWS Guess the Flag
//
//  Created by Alex Castrillo on 9/2/19.
//  Copyright © 2019 Alejo Games. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var flagOne: UIButton!
    
    @IBOutlet weak var flagTwo: UIButton!
    
    @IBOutlet weak var flagThree: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    //Challenge: Keep track of how many questions have been asked
    var numberOfQuestionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        flagOne.layer.borderWidth = 1
        flagTwo.layer.borderWidth = 1
        flagThree.layer.borderWidth = 1
        
        flagOne.layer.borderColor = UIColor.lightGray.cgColor
        flagTwo.layer.borderColor = UIColor.lightGray.cgColor
        flagThree.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
            //ChallengeL When someone chooses the wrong flag, tell them their mistake in your alert message – something like “Wrong! That’s the flag of France,”
            let alertController = UIAlertController(title: title, message: "Wrong! This is the flag for \(countries[correctAnswer]) Minus one point", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(alertController, animated: true)
        }
        
        let alertController = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(alertController, animated: true)
    }
    
    
    func askQuestion(action: UIAlertAction! = nil){
        
        //Challenge: Show one final alert controller after they have answered 10. This should show their final score.
        
        if numberOfQuestionsAsked < 10 {
            numberOfQuestionsAsked += 1
        } else {
            let alertController = UIAlertController(title: "Game Over", message: "You've answered 10! Your final score: \(score)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Reset", style: .default, handler: askQuestion))
            numberOfQuestionsAsked = 0
            present(alertController, animated: true)
            score = 0
        }
        
        countries.shuffle()
        
        flagOne.setImage(UIImage(named: countries[0]), for: .normal)
        flagTwo.setImage(UIImage(named: countries[1]), for: .normal)
        flagThree.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        //Challenge: Show the player’s score in the navigation bar, alongside the flag to guess.
        title = "\(countries[correctAnswer].uppercased()) - Your score: \(score)"
    }

}

