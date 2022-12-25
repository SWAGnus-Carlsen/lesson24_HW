//
//  Post.swift
//  RestAPI_HW
//
//  Created by Vitaliy Halai on 25.12.22.
//

import Foundation


struct Post: Decodable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
}

