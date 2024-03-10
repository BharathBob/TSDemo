//
//  HomeView.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 06/03/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        NavigationView {
            if viewModel.isRefreshing {
                SpinnerView()
            } else {
                VStack {
                    List {
                        ForEach(viewModel.videoPosts) { post in
                            VideoCell(post: post)
                                .listRowBackground(Color.clear)
                                .overlay(
                                    Divider().background(Color.clear),
                                    alignment: .bottom
                                )
                        }
                    }
                    .listStyle(PlainListStyle())
                    .background( LinearGradient(gradient: Gradient(colors:[Color(UIColor(hex: 0x160C90)), .pink, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(.all)
                    )
                    .navigationTitle("Feed")
                    .refreshable {
                        viewModel.fetch()
                    }
                }
            }
        }
        .onAppear(){
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font : UIFont(name: "Montserrat-Bold", size: 24)!]
            
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
