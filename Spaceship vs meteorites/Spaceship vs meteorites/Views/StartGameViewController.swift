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
    @IBOutlet weak var currentPlayerLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startSettings()
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

    private func startSettings() {
        playButton.dropShadow(color: .white, opacity: 0.5, offSet: CGSize(width: 0, height: 0.3), radius: 5)
        settingsButton.cornerRadius(settingsButton.bounds.height / 3)
        currentPlayerLabel.text = UserSettings.shared.currentPlayer?.nickname ?? "not selected"
        selectedShip.setImage(UIImage(named: UserSettings.shared.currentPlayer?.spaceShip ?? "" ), for: .normal)
        reminderLabel.isHidden = true
    }
}
