//
//  CacheManager.swift
//  RestAPI_HW
//
//  Created by Vitaliy Halai on 15.01.23.
//

import Foundation
import AlamofireImage

final class CacheManager {
    private init() {}
    
    static let shared = CacheManager()
    
    let imageCache = AutoPurgingImageCache(
        memoryCapacity: 100_000_000,
        preferredMemoryUsageAfterPurge: 60_000_000
    )
}
