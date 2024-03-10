//
//  VideoCell.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 07/03/24.
//

import SwiftUI
import Foundation
import AVKit

struct VideoCell: View {
    let post: VideoPost
    @State private var isPlaying = false
    @State private var player: AVPlayer?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack(alignment: .center) {
                AsyncImage(url: post.thumbnailUrl)
                { image in image.resizable() } placeholder: { Color(UIColor(hex: 0xF0F0F0)) } .frame( height: 200) .clipShape(RoundedRectangle(cornerRadius: 0))

                Button(action: { if let url = post.videoUrl {
                                        self.player = AVPlayer(url: url)
                                        self.isPlaying.toggle()
                                    }
                                }) {
                                    Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.white)
                                }
            }
             
            HStack(spacing: 3, content: {
                Image("placeholder")
                    .resizable()
                    .frame(width: 35, height:35)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10,height: 10)))
                    .padding([.leading],10)
                VStack(alignment: .leading, spacing: 2) {
                    // Username
                    Text("\(post.username ?? "")")
                        .customFont(CustomFont.appFont(16, fontstyle: .bold))
                        .padding([.leading],8)
                        .foregroundColor(Color(UIColor(hex: 0x160C90)))
                    // postDate
                    Text("\(post.postDate ?? "")")
                        .customFont(CustomFont.appFont(12, fontstyle: .regular))
                        .padding([.leading], 8)
                        .foregroundColor(.gray)
                    
                    Text("\(post.duration ?? "") Mins")
                        .customFont(CustomFont.appFont(10, fontstyle: .regular))
                       .foregroundColor(.blue)
                         .padding(.leading, 8)
                }
                Spacer()
                // Likes
                HStack(spacing:2) {
                    Image(systemName: "heart.circle.fill")
                        .foregroundColor(.red)
                    Text("\(post.likes ?? 0)")
                        .customFont(CustomFont.appFont(14, fontstyle: .bold))
                        .foregroundColor(.red)
                    Text(" Likes")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding([.trailing], 16)
            })
            .padding([.leading, .trailing] ,1)
            .padding([.bottom,   ] ,15)
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
        .padding([.leading, .trailing] ,1)
        .sheet(isPresented: $isPlaying) {
                    AVPlayerView(player: player!)
                }
    }
}

struct VideoCell_Previews: PreviewProvider {
    static var previews: some View {
        let videoPost = VideoPost(id: "post_id_1", videoUrl: URL(string: "https://example.com/videos/video1.mp4")!, thumbnailUrl: URL(string: "https://image.example.com/thumbnail1.png")!, username: "user123", postDate: "01 Mar, 2024", likes: 56, duration: "2")
        VideoCell(post: videoPost)
    }
}
