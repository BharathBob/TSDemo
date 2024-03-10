//
//  PostView.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 06/03/24.
//

import Foundation
import SwiftUI

struct PostView: View {
    @ObservedObject var viewModel: PostViewModel

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, content: {
                Text("Post")
                    .customFont(CustomFont.appFont(24, fontstyle: .bold))
                    .padding([.leading, ], 30)
                    .padding([.top, ], 50)

                 VideoCell(post: viewModel.videoPost ?? viewModel.dummyVideoPost())
                    .listRowBackground(Color.clear)
                    .padding(5)
                Spacer()
            })
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(viewModel: PostViewModel())
    }
}


