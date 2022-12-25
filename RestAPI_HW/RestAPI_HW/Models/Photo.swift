//
//  Photo.swift
//  RestAPI_HW
//
//  Created by Vitaliy Halai on 25.12.22.
//

import Foundation


struct Photo: Decodable {
    let albumId: Int?
    let id: Int?
    let title: String?
    let url: String?
    let thumbnailUrl: String?
}
