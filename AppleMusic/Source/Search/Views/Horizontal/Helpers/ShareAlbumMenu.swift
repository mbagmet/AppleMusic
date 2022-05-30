//
//  ShareAlbumMenu.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 29.04.2022.
//

import SwiftUI

struct ShareAlbumMenu: View {
    var body: some View {
        Menu {
            Button {

            } label: {
                Label("Показать альбом", systemImage: "music.note.house")
            }
            
            Button {

            } label: {
                Label("Поделиться песней...", systemImage: "square.and.arrow.up")
            }
        } label: {
            Image(systemName: "ellipsis")
        }
        .accentColor(.primary)
    }
}

struct ShareAlbumMenu_Previews: PreviewProvider {
    static var previews: some View {
        ShareAlbumMenu()
    }
}
