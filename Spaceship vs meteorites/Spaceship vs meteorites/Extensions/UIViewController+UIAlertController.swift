//
//  UIViewController+UIAlertController.swift
//  Spaceship vs meteorites
//
//  Created by Danil Nurgaliev on 20.04.2021.
//

import Foundation
import UIKit

extension UIViewController {
    func showAllert(allertTitle: String, allertMessage: String, defaultButtonTitle: String) {
        let allertController = UIAlertController(title: allertTitle, message: allertMessage, preferredStyle: .alert)

        allertController.addAction(UIAlertAction(title: defaultButtonTitle, style: .default))
        present(allertController, animated: true, completion: nil)
    }

    func showAllertWithTwoButton(allertTitle: String, allertMessage: String, defaultButtonTitle: String, destructiveButtonTitle: String) {
        let allertController = UIAlertController(title: allertTitle, message: allertMessage, preferredStyle: .alert)

        allertController.addAction(UIAlertAction(title: defaultButtonTitle, style: .default))
        allertController.addAction(UIAlertAction(title: destructiveButtonTitle, style: .destructive))
        present(allertController, animated: true, completion: nil)
    }
}
