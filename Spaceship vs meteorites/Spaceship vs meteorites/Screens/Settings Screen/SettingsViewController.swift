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

    @IBOutlet private weak var nicknameTextField: UITextField!
    @IBOutlet private weak var applyChangesButton: UIButton!
    @IBOutlet private weak var backToMenuButton: UIButton!
    @IBOutlet private weak var easyLevelButton: SelectButton!
    @IBOutlet private weak var mediumLevelButton: SelectButton!
    @IBOutlet private weak var hardLevelButton: SelectButton!
    @IBOutlet private weak var firstShipButton: SelectButton!
    @IBOutlet private weak var secondShipButton: SelectButton!
    @IBOutlet private weak var thirdShipButton: SelectButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        nicknameTextField.returnKeyType = .done
        nicknameTextField.delegate = self
        startSettings()
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
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
