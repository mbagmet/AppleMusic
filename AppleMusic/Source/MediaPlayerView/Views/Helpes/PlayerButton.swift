//
//  PlayerButton.swift
//  AppleMusic
//
//  Created by Михаил on 06.02.2022.
//

import SwiftUI

struct PlayerButton: View {
    var iconName: String

    var body: some View {
        Button {
            // TODO
        } label: {
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(height: 18)
        }
        .frame(width: 40, height: 40)
    }
}

struct PlayerButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayerButton(iconName: "play.fill")
    }
}
