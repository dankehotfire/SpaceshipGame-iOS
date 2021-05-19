//
//  EndGameViewController.swift
//  Spaceship vs meteorites
//
//  Created by Danil Nurgaliev on 04.04.2021.
//

import UIKit

class EndGameViewController: UIViewController {
    var currentShip = UIButton()
    var score = String()

    @IBOutlet private weak var scoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = score
        saveResult()
    }

    @IBAction private func restartButtonPressed(_ sender: UIButton) {
        let destinationVC = MainGameViewController.instantiate()
        destinationVC.modalPresentationStyle = .fullScreen
        destinationVC.currentShip.setImage(currentShip.currentImage, for: .normal)
        present(destinationVC, animated: true, completion: nil)
    }

    @IBAction private func ratingButtonPressed(_ sender: UIButton) {
        let destinationVC = ScoreRatingViewController.instantiate()
        destinationVC.modalPresentationStyle = .fullScreen
        present(destinationVC, animated: true, completion: nil)
    }

    @IBAction private func menuButtonPressed(_ sender: UIButton) {
        let destinationVC = StartGameViewController.instantiate()
        destinationVC.modalPresentationStyle = .fullScreen
        present(destinationVC, animated: true, completion: nil)
    }

    private func saveResult() {
        guard let nickname = UserSettings.shared.currentPlayer?.nickname else {
            return
        }

        guard let ship = UserSettings.shared.currentPlayer?.spaceShip else {
            return
        }

        Manager.saveScore(nickname: nickname, ship: ship, score: score)
    }
}
