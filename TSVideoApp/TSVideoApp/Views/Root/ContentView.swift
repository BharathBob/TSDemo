//
//  ContentView.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 06/03/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            HomeView(viewModel: HomeViewModel())
                 .tabItem {
                      Label("Feed", systemImage: "play.house.fill")
                 }
            PostView(viewModel: PostViewModel())
                .tabItem {
                    Label("Post", systemImage: "video.badge.plus")
                }
            
            ProfileView(viewModel: ProfileViewModel())
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
        .background(Color.white)
        .tint(Color(UIColor(hex: 0x160C90)))
        .onAppear() {
         }
    }
}

#Preview {
    ContentView()
}
