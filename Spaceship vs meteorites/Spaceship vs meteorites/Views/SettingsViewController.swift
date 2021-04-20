//
//  SettingsViewController.swift
//  Spaceship vs meteorites
//
//  Created by Danil Nurgaliev on 19.04.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var applyChangesButton: UIButton!
    @IBOutlet weak var backToMenuButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        applyChangesButton.cornerRadius(applyChangesButton.bounds.height / 3)
        backToMenuButton.cornerRadius(backToMenuButton.bounds.height / 3)
    }

    @IBAction private func applyChangesButtonPressed(_ sender: UIButton) {
    }

    @IBAction private func backToMenuButtonPressed(_ sender: UIButton) {
        let destinationVC = StartGameViewController.instantiate()
        destinationVC.modalPresentationStyle = .fullScreen

        present(destinationVC, animated: true, completion: nil)
    }
}
