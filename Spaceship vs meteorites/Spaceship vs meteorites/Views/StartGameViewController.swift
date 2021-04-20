//
//  StartGameViewController.swift
//  Spaceship vs meteorites
//
//  Created by Danil Nurgaliev on 04.04.2021.
//

import UIKit

class StartGameViewController: UIViewController {
    private var selectedShip = UIButton()

    @IBOutlet private weak var playButton: UIButton!
    @IBOutlet private weak var settingsButton: UIButton!
    @IBOutlet private weak var reminderLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.dropShadow(color: .white, opacity: 0.5, offSet: CGSize(width: 0, height: 0.3), radius: 5)
        settingsButton.cornerRadius(settingsButton.bounds.height / 3)
        reminderLabel.isHidden = true
    }

    @IBAction private func playButtonPressed(_ sender: UIButton) {
        let destinationVC = MainGameViewController.instantiate()
        destinationVC.modalPresentationStyle = .fullScreen

        if selectedShip.currentImage != nil {
            destinationVC.currentShip.setImage(selectedShip.currentImage, for: .normal)
            present(destinationVC, animated: true, completion: nil)
        } else {
            reminderLabel.isHidden = false
        }
    }

    @IBAction private func settingsButtonPressed(_ sender: UIButton) {
        let destinationVC = SettingsViewController.instantiate()
        destinationVC.modalPresentationStyle = .fullScreen

        present(destinationVC, animated: true, completion: nil)
    }
}
