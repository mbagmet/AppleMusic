//
//  ShareStationMenu.swift
//  AppleMusic
//
//  Created by Михаил on 12.02.2022.
//

import SwiftUI

struct ShareStationMenu: View {
    var body: some View {
        Menu {
            Button {

            } label: {
                Label("Поделиться станцией...", systemImage: "square.and.arrow.up")
            }
        } label: {
            Image(systemName: "ellipsis")
        }
        .accentColor(.primary)
    }
}

struct ShareStationMenu_Previews: PreviewProvider {
    static var previews: some View {
        ShareStationMenu()
    }
}
