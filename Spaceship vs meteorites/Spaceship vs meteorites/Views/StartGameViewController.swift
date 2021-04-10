//
//  StartGameViewController.swift
//  Spaceship vs meteorites
//
//  Created by Danil Nurgaliev on 04.04.2021.
//

import UIKit

class StartGameViewController: UIViewController {
    var selectedShip = UIButton()

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var firstShipButton: UIButton!
    @IBOutlet weak var secondShipButton: UIButton!
    @IBOutlet weak var thirdShipButton: UIButton!
    @IBOutlet weak var reminderLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.dropShadow(color: .white, opacity: 0.5, offSet: CGSize(width: 0, height: 0.3), radius: 5)
        reminderLabel.isHidden = true
    }

    @IBAction func playButtonPressed(_ sender: UIButton) {
        let destinationVC = MainGameViewController.instantiate()
        destinationVC.modalPresentationStyle = .fullScreen

        if selectedShip.currentImage != nil {
            destinationVC.currentShip.setImage(selectedShip.currentImage, for: .normal)
            present(destinationVC, animated: true, completion: nil)
        } else {
            reminderLabel.isHidden = false
        }
    }


    @IBAction func shipButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            firstShipButton.dropShadow(color: .red, opacity: 0.5, offSet: CGSize(width: 0, height: 0), radius: 20)
            secondShipButton.layer.shadowOpacity = 0
            thirdShipButton.layer.shadowOpacity = 0
        case 2:
            secondShipButton.dropShadow(color: .red, opacity: 0.5, offSet: CGSize(width: 0, height: 0), radius: 20)
            firstShipButton.layer.shadowOpacity = 0
            thirdShipButton.layer.shadowOpacity = 0
        case 3:
            thirdShipButton.dropShadow(color: .red, opacity: 0.5, offSet: CGSize(width: 0, height: 0), radius: 20)
            firstShipButton.layer.shadowOpacity = 0
            secondShipButton.layer.shadowOpacity = 0
        default:
            break
        }

        selectedShip.setImage(sender.currentImage, for: .normal)
    }
}
