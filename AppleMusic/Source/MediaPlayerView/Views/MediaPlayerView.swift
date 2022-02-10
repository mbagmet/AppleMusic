//
//  MediaPlayerView.swift
//  AppleMusic
//
//  Created by Михаил on 04.02.2022.
//

import SwiftUI

struct MediaPlayerView: View {
    var body: some View {
        VStack {
            Spacer()

            VStack {
                HStack {
                    AlbumImage(image: Image("albumPlaceholder"))

                    Text("Не исполняется")

                    Spacer()

                    HStack(spacing: 15) {
                        PlayerButton(iconName: "play.fill")
                        PlayerButton(iconName: "forward.fill")
                            .disabled(true)
                    }
                    .accentColor(.primary)
                }
                .padding([.top, .leading, .trailing])

                Divider()
            }
            .background(.bar)
        }
    }
}

struct MediaPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPlayerView()
    }
}
