//
//  SecondViewController.swift
//  Kasteleken
//
//  Created by Syvert Andreas Eidjord on 19/09/2019.
//  Copyright © 2019 Eidjord Marketing. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var gameModeNumber : Int?
    var questionNumber : Int?
    var challengeFrequency : Int?
    var allQuestions : QuestionBank?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allQuestions = QuestionBank(gameMode: gameModeNumber!)
        questionNumber = allQuestions!.list.count / 2
        challengeFrequency = Int(challengeSliderLabel.maximumValue / 2)
        questionLabel.text = String(questionNumber!)
        challengeLabel.text = String(challengeFrequency!)
        questionSliderLabel.maximumValue = Float(allQuestions!.list.count)
        questionSliderLabel.setValue(questionSliderLabel.maximumValue / 2, animated: false)
        challengeSliderLabel.setValue(questionSliderLabel.maximumValue / 2, animated: false)
    }
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var challengeLabel: UILabel!
    @IBOutlet weak var questionSliderLabel: UISlider!
    @IBOutlet weak var challengeSliderLabel: UISlider!
    
    @IBAction func questionSlider(_ sender: UISlider) {
        questionNumber = Int(sender.value)
        questionLabel.text = String(Int(sender.value))
    }
    
    @IBAction func challengeSlider(_ sender: UISlider ) {
        challengeFrequency = Int(sender.value)
        challengeLabel.text = String(Int(sender.value))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gameView = segue.destination as! ViewController
        gameView.gameLength = questionNumber!
        gameView.challengeFrequency = challengeFrequency!
        gameView.allQuestions = allQuestions
    }
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "segueGame", sender: self)
    }

}
