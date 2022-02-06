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
                Text("Радио")
                    .navigationTitle("Радио")
            }
            .navigationViewStyle(.stack)

            MediaPlayerView()
        }

    }
}

struct RadioView_Previews: PreviewProvider {
    static var previews: some View {
        RadioView()
    }
}
