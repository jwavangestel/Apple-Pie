//
//  Game.swift
//  Apple Pie
//
//  Created by Jan van gestel on 24/02/2021.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]

    
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        print (guessedWord)
        return guessedWord
    }
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        print("gameword = \(word)")
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1 
        }
        print("over: \(incorrectMovesRemaining)")
        print(guessedLetters)
    }
    


}
