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
        Image("albumPlaceholder")
            .frame(width: 44, height: 44)
            .opacity(0.6)
            .background(
                Color("albumGrayBackground")
                    .opacity(0.15)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color("albumGrayStroke").opacity(0.2), lineWidth: 1)
                    )
            )
    }
}

struct AlbumImage_Previews: PreviewProvider {
    static var previews: some View {
        AlbumImage(image: Image("albumPlaceholder"))
    }
}
