//
//  VideosView.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 10/03/24.
//

import Foundation
import SwiftUI

struct VideosView: View {
    
    let posts:[VideoPost]
    
    var body: some View {
        List {
            ForEach(posts) { post in
                VideoCell(post: post)
                    .padding([.leading, .trailing] ,-20)
                    .listRowBackground(Color.clear)
                    .overlay(
                        Divider().background(Color.clear),
                        alignment: .bottom
                    )
            }
        }
        .listStyle(PlainListStyle())
        .background(Color.clear)
        .padding(12)
    }
}
