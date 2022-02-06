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
                Color.init(#colorLiteral(red: 0.7079379392, green: 0.7601017874, blue: 0.7601017874, alpha: 0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(#colorLiteral(red: 0.5840483093, green: 0.6270834478, blue: 0.6270834478, alpha: 0.2)), lineWidth: 1)
                    )
            )
    }
}

struct AlbumImage_Previews: PreviewProvider {
    static var previews: some View {
        AlbumImage(image: Image("albumPlaceholder"))
    }
}
