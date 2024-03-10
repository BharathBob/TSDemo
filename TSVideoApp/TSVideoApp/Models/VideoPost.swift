//
//  VideoPost.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 07/03/24.
//

import SwiftUI

// Model for Video Post
struct VideoPost: Identifiable, Decodable {
    let id: String?
    let videoUrl: URL?
    let thumbnailUrl: URL?
    let username: String?
    let postDate: String?
    var likes: Int?
    let duration: String?
}
