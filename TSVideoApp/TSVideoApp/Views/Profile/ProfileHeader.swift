//
//  ProfileHeader.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 08/03/24.
//

import SwiftUI

struct ProfileHeader: View {
    let profile: ProfileData

    var body: some View {
        
        VStack(alignment: .leading, content: {
            Text("Profile")
                .customFont(CustomFont.appFont(24, fontstyle: .bold))
                .padding(.top, 30)
                .padding(.leading, 20)

            HStack(alignment: .top, content: {
                AsyncImage(url: profile.profilePictureUrl)
                { image in image.resizable() } placeholder: { Color.gray } .frame( width: 100, height: 100) .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.pink, lineWidth: 2)
                    )
                    .padding(.leading, 20)

                 VStack(alignment: .leading, content: {
                    Text("\(profile.username ?? "")")
                         .customFont(CustomFont.appFont(20, fontstyle: .regular))
                     
                     HStack(spacing:2) {
                         Image(systemName: "heart.circle.fill")
                             .foregroundColor(.red)
                         Text("\(profile.likes ?? "0")")
                             .customFont(CustomFont.appFont(12, fontstyle: .bold))
                             .foregroundColor(.pink)
                         Text(" Likes")
                             .font(.subheadline)
                             .foregroundColor(.gray)
                     }
                     .padding([.trailing], 16)
                }).padding([.leading], 10)
                Spacer()

            })

        })
        
        
        

    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        
        let dummy = loadDummyData()
        
        ProfileHeader(profile: ProfileData(id: 1, username: "viswa harath", profilePictureUrl: nil, likes: "111", posts: dummy, images: []))
    }
}
