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
    @IBOutlet private weak var firstShipButton: UIButton!
    @IBOutlet private weak var secondShipButton: UIButton!
    @IBOutlet private weak var thirdShipButton: UIButton!
    @IBOutlet private weak var reminderLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.dropShadow(color: .white, opacity: 0.5, offSet: CGSize(width: 0, height: 0.3), radius: 5)
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

    @IBAction private func shipButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            firstShipButton.dropShadow(color: .red, opacity: 0.5, offSet: CGSize.zero, radius: 20)
            secondShipButton.layer.shadowOpacity = 0
            thirdShipButton.layer.shadowOpacity = 0
        case 2:
            secondShipButton.dropShadow(color: .red, opacity: 0.5, offSet: CGSize.zero, radius: 20)
            firstShipButton.layer.shadowOpacity = 0
            thirdShipButton.layer.shadowOpacity = 0
        case 3:
            thirdShipButton.dropShadow(color: .red, opacity: 0.5, offSet: CGSize.zero, radius: 20)
            firstShipButton.layer.shadowOpacity = 0
            secondShipButton.layer.shadowOpacity = 0
        default:
            break
        }

        selectedShip.setImage(sender.currentImage, for: .normal)
    }
}
