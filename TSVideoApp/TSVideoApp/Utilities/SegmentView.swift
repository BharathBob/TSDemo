//
//  SegmentView.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 10/03/24.
//

import Foundation
import SwiftUI

enum Segment: String, CaseIterable {
    case images
    case videos
}

struct SegmentView: View {
    @Binding var selectedSegment: Segment
    var profile: ProfileData

    var body: some View {
        switch selectedSegment {
        case .images:
            ImagesView( images: profile.images ?? [])
        case .videos:
            VideosView(posts: profile.posts ?? [])
        }
    }
}
