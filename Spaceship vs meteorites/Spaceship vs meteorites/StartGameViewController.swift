//
//  StartGameViewController.swift
//  Spaceship vs meteorites
//
//  Created by Danil Nurgaliev on 04.04.2021.
//

import UIKit

class StartGameViewController: UIViewController {
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var firstShipButton: UIButton!
    @IBOutlet weak var secondShipButton: UIButton!
    @IBOutlet weak var thirdShipButton: UIButton!

    var selectedShip = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func playButtonPressed(_ sender: UIButton) {
        let destinationVC = MainGameViewController.instantiate()
        destinationVC.modalPresentationStyle = .fullScreen
        destinationVC.currentShip.setImage(selectedShip.currentImage, for: .normal)
        present(destinationVC, animated: true, completion: nil)
    }


    @IBAction func shipButtonPressed(_ sender: UIButton) {
        selectedShip.setImage(sender.currentImage, for: .normal)
    }
}
