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

    @IBOutlet weak var scoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = score
    }

    @IBAction func restartButtonPressed(_ sender: UIButton) {
        let destinationVC = MainGameViewController.instantiate()
        destinationVC.modalPresentationStyle = .fullScreen
        destinationVC.currentShip.setImage(currentShip.currentImage, for: .normal)
        present(destinationVC, animated: true, completion: nil)
    }

    @IBAction func menuButtonPressed(_ sender: UIButton) {
        let destinationVC = StartGameViewController.instantiate()
        destinationVC.modalPresentationStyle = .fullScreen
        present(destinationVC, animated: true, completion: nil)
    }
}
