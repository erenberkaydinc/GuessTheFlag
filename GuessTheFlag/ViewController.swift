//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Eren Berkay Dinç on 22.06.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
    
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
    
        countries += [
            "estonia",
            "france",
            "germany",
            "ireland",
            "italy",
            "monaco",
            "nigeria",
            "poland",
            "russia",
            "spain",
            "us",
            "uk",
            "tr"
        ]
         
        askQuestion(action: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image:UIImage(systemName: "info.circle"), style: .plain, target: self, action: #selector(devInformation))
        
        
    }
    
    @objc func showScore(){
        let alert = UIAlertController(title: "Score", message:"Your current score: " + score.description, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) { UIAlertAction in
            return
        }
        
        alert.addAction(okButton)
        
        present(alert, animated: true)
    }
    
    @objc func devInformation(){
        let alert = UIAlertController(title: "Developer", message:"Created by Eren Berkay Dinç \nCopyright © 2022 "
                    , preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) { UIAlertAction in
            return
        }
        
        alert.addAction(okButton)
        
        present(alert, animated: true)
    }

    
    func askQuestion(action:UIAlertAction!){
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    
        title = countries[correctAnswer].uppercased()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title:"Score: \(score)",style: .plain, target: self, action:#selector(showScore))
        
        
     
        
        if questionsAsked == 10 {
            
            let finalAlert = UIAlertController(title: title, message: "You have answered 10 questions, Game done!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title:"OK", style: .default, handler: {(alert:UIAlertAction!)-> Void in})
            
            finalAlert.addAction(okAction)
            
            present(finalAlert,animated: true)
        }else {
            questionsAsked += 1
        }
        
    }
    
    
    

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        var title : String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        }else{
            title = "Wrong"
            score -= 1
            
        }
        
        
        let ac = UIAlertController(title: title,
                 message: """
            Your score is \(score)
            
            That's \(countries[sender.tag].uppercased()) flag
            """
         , preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: title, style: .default, handler: askQuestion))
        
        present(ac,animated: true)
        
        
        
        
    }
    
    
    

}

