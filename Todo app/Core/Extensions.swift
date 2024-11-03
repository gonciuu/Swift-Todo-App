//
//  Extensions.swift
//  Todo app
//
//  Created by Kacper Wojak on 03/11/2024.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }

        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        guard let dictionary = json as? [String: Any] else {
            return [:]
        }

        return dictionary
    }
}
