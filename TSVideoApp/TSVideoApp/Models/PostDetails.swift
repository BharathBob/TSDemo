//
//  PostDetails.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 07/03/24.
//

import Foundation

// Model for Post Details
struct PostDetails: Identifiable, Decodable {
    let id: String
    let videoUrl: URL
    let thumbnailUrl: URL
    let username: String
    var likes: Int
}
