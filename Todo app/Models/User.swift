//
//  User.swift
//  Todo app
//
//  Created by Kacper Wojak on 19/10/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
