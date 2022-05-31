//
//  AlbumImage.swift
//  AppleMusic
//
//  Created by Михаил on 05.02.2022.
//

import SwiftUI

struct AlbumImage: View {
    var image: Image

    var body: some View {
        Image("song")
            .resizable()
            .scaledToFit()
            .frame(width: 44, height: 44)
            .clipShape(RoundedRectangle(cornerRadius: 3))
            .shadow(color: Color("albumGrayBackground"), radius: 4, x: 0, y: 4)
            .opacity(0.8)
            .background(
                Color("albumGrayBackground")
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color("albumGrayStroke").opacity(0.5), lineWidth: 1)
                    )
            )
    }
}

struct AlbumImage_Previews: PreviewProvider {
    static var previews: some View {
        AlbumImage(image: Image("albumPlaceholder"))
    }
}
