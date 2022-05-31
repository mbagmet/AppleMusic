//
//  SongMenu.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 31.05.2022.
//

import SwiftUI

struct SongMenu: View {
    var body: some View {
        Menu {
            Button {

            } label: {
                Label("Поделиться станцией...", systemImage: "square.and.arrow.up")
            }
        } label: {
            Image(systemName: "ellipsis.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(Color("topGray"))
                .background(
                    Color("dividerGray")
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                )
        }
        .accentColor(.primary)
    }
}

struct SongMenu_Previews: PreviewProvider {
    static var previews: some View {
        SongMenu()
    }
}
