//
//  User.swift
//  RestAPI_HW
//
//  Created by Vitaliy Halai on 25.12.22.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String?
    let username: String?
    let email: String?
    let phone: String?
    let website: String?
    let address: Address?
    let company: Company?
}
