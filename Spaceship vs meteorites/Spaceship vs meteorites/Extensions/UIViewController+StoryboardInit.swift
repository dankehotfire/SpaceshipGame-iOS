//
//  UIViewController+StoryboardInstantiate.swift
//  Spaceship vs meteorites
//
//  Created by Danil Nurgaliev on 06.04.2021.
//

import UIKit

extension UIViewController {
    static func instantiate() -> Self {
        let name = String(describing: Self.self)
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        guard let viewController = storyboard.instantiateInitialViewController() as? Self else {
            fatalError("Can't init view controller from storyboard")
        }
        return viewController
    }
}
