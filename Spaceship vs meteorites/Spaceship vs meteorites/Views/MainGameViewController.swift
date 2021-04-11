//
//  ViewController.swift
//  Spaceship vs meteorites
//
//  Created by Danil Nurgaliev on 04.04.2021.
//

import UIKit

class MainGameViewController: UIViewController {
    private var timer = Timer()
    let currentShip = UIButton()

    @IBOutlet private weak var firstMeteoriteImage: UIImageView!
    @IBOutlet private weak var UFOImage: UIImageView!
    @IBOutlet private weak var secondMeteoriteImage: UIImageView!
    @IBOutlet private weak var batteryImage: UIImageView!
    @IBOutlet private weak var spaceshipButton: UIButton!
    @IBOutlet private weak var progressView: UIProgressView!
    @IBOutlet private weak var scoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        firstMeteoriteImage.frame.origin.y = 0
        secondMeteoriteImage.frame.origin.y -= 200
        UFOImage.frame.origin.y -= 400
        batteryImage.frame.origin.y -= 200

        spaceshipButton.setImage(currentShip.currentImage, for: .normal)

        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(meteoriteAnimation), userInfo: nil, repeats: true)
    }
    @IBAction private func onPan(_ sender: UIPanGestureRecognizer) {
        let move = sender.translation(in: view)
        if let view = sender.view {
            view.center = CGPoint(x: view.center.x + move.x, y: view.center.y + move.y)
        }
        sender.setTranslation(CGPoint.zero, in: view)
    }

    private func metoriteMovement (object: UIImageView) {
        if object.frame.origin.y > view.frame.height {
            object.frame.origin.y = CGFloat(Int.random(in: (-500)...0))
        } else {
            object.frame = CGRect(x: object.frame.origin.x, y: object.frame.origin.y + 1, width: object.frame.size.width, height: object.frame.size.height)
        }
    }

    @objc private func meteoriteAnimation() {
        let destinationVC = EndGameViewController.instantiate()
        let shipFrame = spaceshipButton.frame

        metoriteMovement(object: firstMeteoriteImage)
        metoriteMovement(object: secondMeteoriteImage)
        metoriteMovement(object: batteryImage)
        metoriteMovement(object: UFOImage)

        progressView.progress -= 0.000_1

        if (shipFrame.intersects(firstMeteoriteImage.frame)) || shipFrame.intersects(secondMeteoriteImage.frame) || shipFrame.intersects(UFOImage.frame) {
            destinationVC.modalPresentationStyle = .fullScreen
            destinationVC.currentShip.setImage(currentShip.currentImage, for: .normal)
            timer.invalidate()
            destinationVC.score = scoreLabel.text ?? "0"
            present(destinationVC, animated: true, completion: nil)
        }

        if batteryImage.frame.intersects(spaceshipButton.frame) {
            let random = Int.random(in: 0...Int(view.frame.width))

            batteryImage.frame.origin.y = 0 - 80
            batteryImage.frame.origin.x = CGFloat(random)

            guard let score = scoreLabel.text else {
                return
            }
            guard var temp = Int(score) else {
                return
            }
            progressView.progress += 0.1
            temp += 10
            scoreLabel.text = "\(temp)"
        }
    }
}
