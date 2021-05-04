//
//  SelectButton.swift
//  Spaceship vs meteorites
//
//  Created by Danil Nurgaliev on 22.04.2021.
//

import UIKit

class SelectButton: UIButton {
    var selectedImage = UIImage()

    override var isSelected: Bool {
        didSet {
            setBackgroundImage(isSelected ?  selectedImage : .none, for: .normal)
        }
    }
}
