//
//  PlaybackButtonsView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 31.05.2022.
//

import SwiftUI

struct PlaybackButtonsView: View {
    @Binding var isPlaying: Bool
    
    var body: some View {
        HStack {
            Spacer()

            HStack(spacing: 50) {
                PlayerButton(buttonSize: .big, iconName: "backward.fill")
                PlayButton(isPlaying: $isPlaying)
                PlayerButton(buttonSize: .big, iconName: "forward.fill")
            }
            .tint(Color("dividerGray"))
            
            Spacer()
        }
    }
}

struct PlaybackButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackButtonsView(isPlaying: .constant(false))
    }
}
