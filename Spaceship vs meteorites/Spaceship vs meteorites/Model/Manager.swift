//
//  FileManager.swift
//  Spaceship vs meteorites
//
//  Created by Danil Nurgaliev on 22.04.2021.
//

import Foundation

enum Manager {
    static func dateCreater() -> String {
        let date = Date()
        let formatter = DateFormatter()

        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let stringDate = formatter.string(from: date)

        return stringDate
    }

    static func saveScore(nickname: String, ship: String, score: String) {
        let date = dateCreater()
        let file = "\(date).json"
        let documentsDirectoryPath = FileManager.getDocumentsDir()
        var folderPath = documentsDirectoryPath
        folderPath.appendPathComponent("Results")

        let result = ResultModel(nickname: nickname, ship: ship, score: score)
        let data = try? JSONEncoder().encode(result)
        let dataPath = folderPath.appendingPathComponent(file)

        try? FileManager.default.createDirectory(at: folderPath, withIntermediateDirectories: false, attributes: nil)

        FileManager.default.createFile(atPath: dataPath.path, contents: data, attributes: nil)
    }
}
