//
//  User.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 19.10.2025.
//

import Foundation

struct User: Codable {
    let id: String
    let email: String
    let name: String
    let joined: TimeInterval
}
