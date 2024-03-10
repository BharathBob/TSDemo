//
//  ProfileViewModel.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 07/03/24.
//

import Foundation
import SwiftUI
import Combine

class ProfileViewModel: ObservableObject {
    @Published var profile: ProfileData?
    private var cancellables: Set<AnyCancellable> = []

    init() {
         fetchProfile()
    }
     
    func fetchProfile() {
        NetworkManager.shared.request(APIPath.profile)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { (responseData: ProfileData) in
                self.profile = responseData
            }
            .store(in: &cancellables)
    }
 }

extension ProfileViewModel {
    
    internal func getPosts() -> [VideoPost] {
        return profile?.posts ?? loadDummyData()!
     }

    internal func getDummyProfile() -> ProfileData {
        return profile ?? loadDummyProfileData()!
     }

}
