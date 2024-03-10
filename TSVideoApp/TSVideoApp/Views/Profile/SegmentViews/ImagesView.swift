//
//  ImagesView.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 10/03/24.
//

import Foundation
import SwiftUI

struct ImagesView: View {
  
     private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 125))
    ]
    
    let images:[String]
    let aspect = 2.0
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)

    var body: some View {
        VStack {
            ScrollView{
                LazyVGrid(columns: columns, spacing: 1) {
                    ForEach(images, id: \.self) { item in
                        VStack {
                             AsyncImage(url: URL(string: item))
                            { image in image.resizable() } placeholder: { Color(UIColor(hex: 0xF0F0F0)) } 
                                .frame(width: 130, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 0))
                                .aspectRatio(aspect, contentMode: .fit)
                         }
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(Color.black, lineWidth: 0)
                        )
                    }
                }
                .padding(0)
            }

        }   
    }
}
