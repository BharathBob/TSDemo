//
//  ProfileView.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 06/03/24.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State private var selectedSegment: Segment = .images
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 5) {
                ProfileHeader(profile: viewModel.profile ?? viewModel.getDummyProfile())
                    .frame(height: 150)
                
                VStack {
                    Picker(selection: $selectedSegment, label: Text("Select a segment")) {
                        ForEach(Segment.allCases, id: \.self) { segment in
                            Text(segment.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.top, 30)
                    .padding([.leading,.trailing], 20)

                    SegmentView(selectedSegment: $selectedSegment, profile: viewModel.profile ?? viewModel.getDummyProfile())
                        .padding()
                }
                
                Spacer()
            }
            .navigationBarItems(trailing:
                NavigationLink(destination: SettingsView()) {
                    Image(systemName: "gearshape")
                }
            )
        }
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
         ProfileView(viewModel: ProfileViewModel())
    }
}
