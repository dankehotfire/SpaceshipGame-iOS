//
//  PlayerModel.swift
//  Spaceship vs meteorites
//
//  Created by Danil Nurgaliev on 21.04.2021.
//

import Foundation

struct PlayerModel: Codable {
    let nickname: String
    let spaceShip: String
    let gameLevel: GameLevel
}
