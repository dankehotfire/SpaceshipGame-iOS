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

    @IBOutlet private weak var scoreTitleLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var endGameTitle: UILabel!
    @IBOutlet private weak var restartButtonTitle: UIButton!
    @IBOutlet private weak var ratingButtonTitle: UIButton!
    @IBOutlet private weak var menuButtonTitle: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = score
        saveResult()
        localizable()
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
            assertionFailure("nickname is nil")
            return
        }

        guard let ship = UserSettings.shared.currentPlayer?.spaceShip else {
            assertionFailure("ship is nil")
            return
        }

        Manager.saveScore(nickname: nickname, ship: ship, score: score)
    }

    private func localizable() {
        scoreTitleLabel.text = NSLocalizedString("end_game_screen_score", comment: "")
        endGameTitle.text = NSLocalizedString("end_game_screen_game_over", comment: "")
        restartButtonTitle.setTitle(NSLocalizedString("end_game_screen_restart", comment: ""), for: .normal)
            ratingButtonTitle.setTitle(NSLocalizedString("end_game_screen_rating", comment: ""), for: .normal)
        menuButtonTitle.setTitle(NSLocalizedString("end_game_screen_menu", comment: ""), for: .normal)
    }
}
