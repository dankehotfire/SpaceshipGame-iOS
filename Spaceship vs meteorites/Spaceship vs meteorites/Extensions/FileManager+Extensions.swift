//
//  FileManager+Extensions.swift
//  Spaceship vs meteorites
//
//  Created by Danil Nurgaliev on 09.05.2021.
//

import Foundation

extension FileManager {
    static func getDocumentsDir() -> URL {
        let documentsDirectoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documentsDirectoryPath
    }

    static func createOrFindDirectory(named name: String) -> URL? {
        let documentsDirectoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let dirPath = documentsDirectoryPath.appendingPathComponent(name)

        do {
            try self.default.createDirectory(at: dirPath, withIntermediateDirectories: true, attributes: nil)
            return dirPath
        } catch {
            print("Error creating \(name) directory with error: \(error)")
            return nil
        }
    }
}
