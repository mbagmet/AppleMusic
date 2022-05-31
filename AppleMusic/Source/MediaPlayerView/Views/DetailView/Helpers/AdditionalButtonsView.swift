//
//  AdditionalButtonsView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 31.05.2022.
//

import SwiftUI

struct AdditionalButtonsView: View {
    var body: some View {
        HStack {
            Spacer()

            HStack(spacing: 50) {
                PlayerButton(iconName: "quote.bubble")
                PlayerButton(iconName: "airplayaudio")
                PlayerButton(iconName: "list.bullet")
            }
            .tint(Color("albumGrayBackground"))
            
            Spacer()
        }
    }
}

struct AdditionalButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionalButtonsView()
    }
}
