//
//  PlayerModel.swift
//  Spaceship vs meteorites
//
//  Created by Danil Nurgaliev on 20.04.2021.
//

import Foundation

class UserSettings {
    static let shared = UserSettings()
    let defaults = UserDefaults.standard

    var currentPlayer: PlayerModel? {
        get {
            if let data = defaults.value(forKey: "players") as? Data {
                return try? PropertyListDecoder().decode(PlayerModel.self, from: data)
            }
            return nil
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "players")
            }
        }
    }

    func savePlayer(nickname: String, spaseShip: String, gameLevel: GameLevel) {
        let player = PlayerModel(nickname: nickname, spaceShip: spaseShip, gameLevel: gameLevel)
        currentPlayer = player
    }
}
