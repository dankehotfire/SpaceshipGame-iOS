//
//  SettingsViewController.swift
//  Spaceship vs meteorites
//
//  Created by Danil Nurgaliev on 19.04.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    var selectedShip: String?
    var selectedGameLevel: GameLevel?
    let defaults = UserDefaults.standard

    @IBOutlet private weak var settingsTitle: UILabel!
    @IBOutlet private weak var nicknameLabel: UILabel!
    @IBOutlet private weak var gameLevelLabel: UILabel!
    @IBOutlet private weak var spaceshipLabel: UILabel!
    @IBOutlet private weak var nicknameTextField: UITextField!
    @IBOutlet private weak var applyChangesButton: UIButton!
    @IBOutlet private weak var backToMenuButton: UIButton!
    @IBOutlet private weak var easyLevelButton: SelectButton!
    @IBOutlet private weak var mediumLevelButton: SelectButton!
    @IBOutlet private weak var hardLevelButton: SelectButton!
    @IBOutlet private weak var firstShipButton: SelectButton!
    @IBOutlet private weak var secondShipButton: SelectButton!
    @IBOutlet private weak var thirdShipButton: SelectButton!
    @IBOutlet private weak var applyButtonTitle: UIButton!
    @IBOutlet private weak var backButtonTitle: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        nicknameTextField.returnKeyType = .done
        nicknameTextField.delegate = self
        startSettings()
        localizable()
    }

    @IBAction private func gameLevelButtonPressed(_ sender: SelectButton) {
        switch sender.tag {
        case 0:
            selectedGameLevel = .easy
            easyLevelButton.isSelected = true
            mediumLevelButton.isSelected = false
            hardLevelButton.isSelected = false
        case 1:
            selectedGameLevel = .medium
            easyLevelButton.isSelected = false
            mediumLevelButton.isSelected = true
            hardLevelButton.isSelected = false
        case 2:
            selectedGameLevel = .hard
            easyLevelButton.isSelected = false
            mediumLevelButton.isSelected = false
            hardLevelButton.isSelected = true
        default:
            break
        }
    }

    @IBAction private func shipButtonPressed(_ sender: SelectButton) {
        switch sender.tag {
        case 1:
            selectedShip = "ic_first_spaceship"
            firstShipButton.isSelected = true
            secondShipButton.isSelected = false
            thirdShipButton.isSelected = false
        case 2:
            selectedShip = "ic_second_spaceship"
            firstShipButton.isSelected = false
            secondShipButton.isSelected = true
            thirdShipButton.isSelected = false
        case 3:
            selectedShip = "ic_third_spaceship"
            firstShipButton.isSelected = false
            secondShipButton.isSelected = false
            thirdShipButton.isSelected = true
        default:
            break
        }
    }

    @IBAction private func applyChangesButtonPressed(_ sender: UIButton) {
        guard let selectedShip = selectedShip, let selectedGameLevel = selectedGameLevel, let nickname = nicknameTextField.text else {
            return showAlert(alertTitle: "Error", alertMessage: "You have to select all fields", defaultButtonTitle: "Cancel")
        }

        let nicknameTrimmingText = nickname.trimmingCharacters(in: .whitespaces)

        UserSettings.shared.savePlayer(nickname: nicknameTrimmingText, spaseShip: selectedShip, gameLevel: selectedGameLevel)
    }
    @IBAction private func backToMenuButtonPressed(_ sender: UIButton) {
        let destinationVC = StartGameViewController.instantiate()
        destinationVC.modalPresentationStyle = .fullScreen

        present(destinationVC, animated: true, completion: nil)
    }

    private func startSettings() {
        applyChangesButton.cornerRadius(applyChangesButton.bounds.height / 3)
        backToMenuButton.cornerRadius(backToMenuButton.bounds.height / 3)
        nicknameTextField.text = UserSettings.shared.currentPlayer?.nickname

        guard let image = UIImage(named: "ic_button_back") else {
            return
        }

        firstShipButton.selectedImage = image
        secondShipButton.selectedImage = image
        thirdShipButton.selectedImage = image
        easyLevelButton.selectedImage = image
        mediumLevelButton.selectedImage = image
        hardLevelButton.selectedImage = image
    }

    private func localizable() {
        settingsTitle.text = NSLocalizedString("settings_screen_title", comment: "")
        nicknameLabel.text = NSLocalizedString("settings_screen_level_nickname", comment: "")
        gameLevelLabel.text = NSLocalizedString("settings_screen_level_title", comment: "")
        spaceshipLabel.text = NSLocalizedString("settings_screen_ship_title", comment: "")
        applyButtonTitle.setTitle(NSLocalizedString("settings_screen_save_button", comment: ""), for: .normal)
        backButtonTitle.setTitle(NSLocalizedString("settings_screen_back_button", comment: ""), for: .normal)
        easyLevelButton.setTitle(NSLocalizedString("settings_screen_level_easy", comment: ""), for: .normal)
        mediumLevelButton.setTitle(NSLocalizedString("settings_screen_level_medium", comment: ""), for: .normal)
        hardLevelButton.setTitle(NSLocalizedString("settings_screen_level_hard", comment: ""), for: .normal)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
