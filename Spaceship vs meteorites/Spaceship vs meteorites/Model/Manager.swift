//
//  FileManager.swift
//  Spaceship vs meteorites
//
//  Created by Danil Nurgaliev on 22.04.2021.
//

import Foundation

enum Manager {
    static func someFunc(result: String) {
        let currentDate = Date()
        let file = "\(currentDate).txt"
        if let documentsDirectoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath = documentsDirectoryPath.appendingPathComponent(file)
            print(filePath)
            try? result.write(to: filePath, atomically: false, encoding: .utf8)
        }
    }
}
