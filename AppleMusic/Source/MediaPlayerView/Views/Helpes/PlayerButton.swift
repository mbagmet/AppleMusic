//
//  PlayerButton.swift
//  AppleMusic
//
//  Created by Михаил on 06.02.2022.
//

import SwiftUI

struct PlayerButton: View {
    @State var buttonSize: ButtonSize = .small
    
    var iconName: String

    var body: some View {
        Button {

        } label: {
           if buttonSize == .small {
               Image(systemName: iconName)
                   .resizable()
                   .scaledToFit()
                   .frame(height: 18)
           } else {
               Image(systemName: iconName)
                   .resizable()
                   .scaledToFit()
           }
        }
        .frame(width: 40, height: 40)
    }
}

struct PlayerButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayerButton(iconName: "play.fill")
    }
}

extension PlayerButton {
    enum ButtonSize {
        case small
        case big
    }
}
