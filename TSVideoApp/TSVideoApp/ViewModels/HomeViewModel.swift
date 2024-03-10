//
//  HomeViewModel.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 07/03/24.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var videoPosts: [VideoPost] = []
    private var cancellables: Set<AnyCancellable> = []
    @Published var isRefreshing = false

    init()  {
        isRefreshing = true
          fetch()
    }
    
    func fetch()  {
        NetworkManager.shared.request(APIPath.feed)
            .sink { completion in
                switch completion {
                case .finished:
                    self.isRefreshing = false
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { (responseData: [VideoPost]) in
                self.videoPosts = responseData
                self.isRefreshing = false
            }
            .store(in: &cancellables)
    }
}
