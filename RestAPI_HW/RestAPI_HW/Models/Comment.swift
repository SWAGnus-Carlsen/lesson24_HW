//
//  Comment.swift
//  RestAPI_HW
//
//  Created by Vitaliy Halai on 25.12.22.
//

import Foundation
// MARK: - Comment

struct Comment: Decodable {
    let postId: Int?
    let id: Int?
    let name: String?
    let email: String?
    let body: String?
}


