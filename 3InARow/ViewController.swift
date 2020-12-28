//
//  ViewController.swift
//  3InARow
//
//  Created by Miranda Mutka on 2020-12-15.
//

import UIKit

class ViewController: UIViewController {
    
    var currentPlayer = 1 // Star
    var currentGame = true
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winCombos = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]
    
    
    @IBAction func buttonAction(_ sender: AnyObject) {
        if(gameState[sender.tag-1] == 0 && currentGame == true) {
            gameState[sender.tag-1] = currentPlayer
            if(currentPlayer == 1) {
                sender.setImage(UIImage(named: "star"), for: UIControl.State())
                currentPlayer = 2
            }
            else {
                sender.setImage(UIImage(named: "moon"), for: UIControl.State())
                currentPlayer = 1
            }
        }
        
        for combo in winCombos {
            if gameState[combo[0]] != 0 && gameState[combo[0]] == gameState[combo[1]] && gameState[combo[1]] == gameState[combo[2]] {
                currentGame = false
                
                if gameState[combo[0]] == 1 {
                     // Star has won
                    playerNameLabel.text = "Star won!"
                }
                else {
                    // Moon has won
                    playerNameLabel.text = "Moon won!"
                }
                
                restartButton.isHidden = false
                playerNameLabel.isHidden = false
                
            }
        }
        
        currentGame = false
        
        for game in gameState {
            if game == 0 {
                currentGame = true
                break
            }
        }
        
        if currentGame == false {
            playerNameLabel.text = "It's a draw!"
            playerNameLabel.isHidden = false
            restartButton.isHidden = false
        }
        
    }
    
    @IBOutlet weak var restartButton: UIButton!
    
    @IBAction func restartButton(_ sender: AnyObject) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        currentGame = true
        currentPlayer = 1
        
        restartButton.isHidden = true
        playerNameLabel.isHidden = true

        for tag in 1...9 {
            let button = view.viewWithTag(tag) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
        
    }
    
    @IBOutlet weak var playerNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        playerNameLabel.text = "PlayerName"
        // Do any additional setup after loading the view.
    }


}

