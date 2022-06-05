//
//  PlayButton.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 31.05.2022.
//

import SwiftUI

struct PlayButton: View {
    @Binding var isPlaying: Bool
    
    private var iconName: String {
        if isPlaying {
            return "pause.fill"
        } else {
            return "play.fill"
        }
    }

    var body: some View {
        Button {
            withAnimation(.spring()) {
                isPlaying.toggle()
            }
        } label: {
               Image(systemName: iconName)
                   .resizable()
                   .scaledToFit()
        }
        .frame(width: 40, height: 40)
    }
}

struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayButton(isPlaying: .constant(false))
    }
}
