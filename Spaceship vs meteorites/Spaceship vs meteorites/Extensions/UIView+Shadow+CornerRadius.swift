//
//  UIView+shadow.swift
//  Spaceship vs meteorites
//
//  Created by Danil Nurgaliev on 10.04.2021.
//

import UIKit

extension UIView {
    func dropShadow(color: UIColor, opacity: Float, offSet: CGSize, radius: CGFloat) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
    }

    func cornerRadius(_ cornerRadius: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
    }
}
