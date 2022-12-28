//
//  Adress.swift
//  RestAPI_HW
//
//  Created by Vitaliy Halai on 25.12.22.
//

import Foundation

struct Address: Codable {
    let street: String?
    let suite: String?
    let city: String?
    let zipcode: String?
    let geo: Geo?
}

