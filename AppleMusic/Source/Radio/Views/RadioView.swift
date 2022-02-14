//
//  RadioView.swift
//  AppleMusic
//
//  Created by Михаил on 04.02.2022.
//

import SwiftUI

struct RadioView: View {
    var body: some View {
        ZStack {
            NavigationView {
                GeometryReader { geometry in
                    ScrollView(.vertical, showsIndicators: true) {
                        RadioSectionView(geometry: geometry)
                        StationsSectionView()
                    }
                }
                .navigationTitle("Радио")
                .padding(.bottom, 80)
            }
            .navigationViewStyle(.stack)

            MediaPlayerView()
        }
    }
}

struct RadioView_Previews: PreviewProvider {
    static var previews: some View {
        RadioView()
            .environmentObject(ModelData())
    }
}
