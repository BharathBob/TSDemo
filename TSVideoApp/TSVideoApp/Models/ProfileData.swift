//
//  ProfileData.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 08/03/24.
//

import Foundation
 
struct ProfileData: Identifiable, Decodable {
    var id: Int?
    let username: String?
    let profilePictureUrl: URL?
    var likes: String?
    let posts: [VideoPost]?
    let images: [String]?

    private enum CodingKeys: String, CodingKey {
        case id
        case username
        case likes
        case posts
        case profilePictureUrl
        case images
    }
}
