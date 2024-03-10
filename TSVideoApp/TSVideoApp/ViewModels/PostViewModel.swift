//
//  PostViewModel.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 07/03/24.
//

import Foundation
import SwiftUI
import Combine

class PostViewModel: ObservableObject {
    @Published var videoPost: VideoPost?
    private var cancellables: Set<AnyCancellable> = []

    init() {
        fetchPost()
     }

    func fetchPost() {
        NetworkManager.shared.request(APIPath.apipost)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { (responseData: VideoPost) in
                self.videoPost = responseData
            }
            .store(in: &cancellables)
    }
    
    func dummyVideoPost() -> VideoPost {
       return VideoPost(id: "post_id_1", videoUrl: URL(string: "https://example.com/videos/video1.mp4")!, thumbnailUrl: URL(string: "https://image.example.com/thumbnail1.png")!, username: "user123", postDate: "01 Mar, 2024", likes: 56, duration: "2")
    }
}
