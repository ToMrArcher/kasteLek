//
//  ViewController.swift
//  Kasteleken
//
//  Created by Syvert Andreas Eidjord on 13/09/2019.
//  Copyright © 2019 Eidjord Marketing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // allQuestions: Every single question in the questionbank. It will be used to shuffle the questions and feeds into gamequestions.
    // allChallenges: Every single challenge in the challengebank. It will be used to pick random challenges that feeds into gamequestions.
    // gameQuestions: Initializes the game question array that stores a single games' questions and challenges.
    // questionNumber: The current question in the ongoing game. Start at 0 and resets every new game.
    var allQuestions : QuestionBank!
    let allChallenges = ChallengeBank()
    var gameQuestions = [Question]()
    var questionNumber = 0
    
    // challengeFrequency: How often a challenge should be initialized.
    // gameLength: How long the game should go on.
    var challengeFrequency = 5
    var gameLength = 30
    
    // questionText: The label for the question or challenge text.
    // titleText: The label for the title (Kaste/Challenge)
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var titleText: UILabel!
    
    // Run when the view loads.
    // It runs the function startOver to shuffle restart the game, as the restart requires exactly what the first start needs.
    override func viewDidLoad() {
        super.viewDidLoad()
        startOver()
    }
    
    // Run when preparing to go into the settings screen.
    // secondController: The reference to the destination, in this case SecondViewController
    // It then proceeds to pass on gameLength from this ViewController into questionNumbebr in the SecondViewController
    // It then proceeds to pass on challengeFrequency from this viewController into challengeFrequency in the SecondViewController
    
    // Function to bring out the next question from the gameQuestions array.
    func nextQuestion() {
        
        // Checks if we have reached or exeeded the range of the gameQuestions array.
        if(questionNumber >= gameQuestions.count){
            
            // Creates the alert that says you have completed the game.
            let alert = UIAlertController(title: "Awesome!", message: NSLocalizedString("Du fullførte spillet!", comment: ""), preferredStyle: .alert)
            
            // Creates the action that you can press in the above alert to restart the game by running startOver()
            let restartAction = UIAlertAction(title: "Start Over", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            // Adds the action to the alert, and presents it to the view.
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
        // If we havent reached the end, we display the next question
        else{
            
            // If the next question is a challenge or a "kaste", we display the represented title.
            if gameQuestions[questionNumber].questionType == .challenge{
                titleText.text = "Challenge"
            }
            else {
                titleText.text = NSLocalizedString("Kaste", comment: "")
            }
            // Changes the text on screen to the current question
            questionText.text = gameQuestions[questionNumber].questionText
        }
        // Increments the current question number.
        questionNumber += 1
        
    }
    
    // Function to stock the gameQuestions array on startup or restart.
    func stockGameQuestions(){
        
        // Shuffles the all questions list, and removes all the current questions from the game questions list.
        allQuestions.list.shuffle()
        gameQuestions.removeAll()
        
        // A while loop to increment until we reach the game length.
        var i = 0
        while i < gameLength{
            
            //Appends the allQuestions[i] to the end of the gameQuestions array.
            gameQuestions.append(allQuestions.list[i])
            i += 1
            //Checks if challenge frequency is hit and adds a challenge. Also increments by one more to reflect the addition of a kaste and challenge.
            if challengeFrequency > 0 && i <= gameLength {
                if i % challengeFrequency == 0 && i >= 1{
                    gameQuestions.append(allChallenges.list.randomElement()!)
                    i += 1
                }
            }
            
            
        }
        
    }
    
    //Function to start over or startup.
    func startOver(){
        
        //Sets questionNumber back to zero, stocks the gameQuestions, and displays the next question (the first question)
        questionNumber = 0
        stockGameQuestions()
        nextQuestion()
        
    }
    
    // Function run when the button is pressed, displays the next question.
    @IBAction func pressButton(_ sender: Any) {
        
        nextQuestion()
        
    }
    
}

