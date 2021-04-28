//
//  UIViewController+UIAlertController.swift
//  Spaceship vs meteorites
//
//  Created by Danil Nurgaliev on 20.04.2021.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(alertTitle: String, alertMessage: String, defaultButtonTitle: String) {
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: defaultButtonTitle, style: .default))
        present(alertController, animated: true, completion: nil)
    }

    func showAllertWithTwoButton(alertTitle: String, alertMessage: String, defaultButtonTitle: String, destructiveButtonTitle: String) {
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: defaultButtonTitle, style: .default))
        alertController.addAction(UIAlertAction(title: destructiveButtonTitle, style: .destructive))
        present(alertController, animated: true, completion: nil)
    }
}
