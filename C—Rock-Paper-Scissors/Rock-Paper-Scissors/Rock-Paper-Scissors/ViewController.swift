//
//  ViewController.swift
//  Rock-Paper-Scissors
//
//  Created by Declan Wallace on 5/6/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var appSignLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(for: .start)
    }
    
    @IBAction func rockButtonTapped(_ sender: UIButton) {
        play(playerSign: .rock)
    }
    
    @IBAction func paperButtonTapped(_ sender: UIButton) {
        play(playerSign: .paper)
    }
    
    @IBAction func scissorsButtonTapped(_ sender: UIButton) {
        play(playerSign: .scissors)
    }
    
    @IBAction func playAgainButtonTapped(_ sender: UIButton) {
        updateUI(for: .start)
    }
    
    func updateUI(for state: GameState) {
        switch state {
        case .start:
            statusLabel.text = "Choose your sign"
            view.backgroundColor = UIColor.white
            appSignLabel.text = "🤖"
            playAgainButton.isHidden = true
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorsButton.isEnabled = true
            rockButton.isHidden = false
            paperButton.isHidden = false
            scissorsButton.isHidden = false
        case .win:
            statusLabel.text = "You win!"
            view.backgroundColor = UIColor.green
        case .lose:
            statusLabel.text = "You lose!"
            view.backgroundColor = UIColor.red
        case .draw:
            statusLabel.text = "It's a draw!"
            view.backgroundColor = UIColor.yellow 
        }
    }
    
    func play(playerSign: Sign) {
        let appSign = randomSign()
        let gameState = playerSign.compare(with: appSign)
        updateUI(for: gameState)
        
        appSignLabel.text = appSign.emoji
        
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        switch playerSign {
        case .rock:
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
        }
        
        playAgainButton.isHidden = false
    }
}
