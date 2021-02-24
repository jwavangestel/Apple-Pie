//
//  ViewController.swift
//  Apple Pie
//
//  Created by Jan van gestel on 23/02/2021.
//

import UIKit



class ViewController: UIViewController {
    
    var listOfWords =   ["aap",
                         "noot",
                         "wies",
                         "wim",
                         "zus",
                         "jet"
                        ]

    let incorrectMovesAllowed = 7

    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    
    var currentGame: Game!

    @IBOutlet var treeImageView: UIImageView!
    

    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        }
        // Do any additional setup after loading the view.
    func  newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            print(newWord)
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters:  [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
        }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
            }
        }
    
    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
            }
        let wordWithspacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithspacing
        scoreLabel.text = "Wins: \(totalWins)   Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        print("Tree \(currentGame.incorrectMovesRemaining)")
        }
    
    


    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        
        updateGameState()
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord  {
                totalWins += 1
        } else {
            updateUI()
        }
    }

}
