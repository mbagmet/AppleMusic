//
//  FeaturedSectionView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 07.03.2022.
//

import SwiftUI

struct FeaturedSectionView: View {
    @EnvironmentObject var modelData: ModelData

    var featuredAlbum: [Album] {
        modelData.albums.filter { album in
            album.isFeatured
        }
    }

    var geometry: GeometryProxy

    let rows = [
        GridItem(.adaptive(minimum: 280, maximum: 320))
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(featuredAlbum) { album in
                    FeaturedCellView(album: album)
                        .frame(width: geometry.size.width * 0.92)
                }
            }
            .padding([.horizontal])
        }
    }
}

struct FeaturedSectionView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            FeaturedSectionView(geometry: geometry)
                .environmentObject(ModelData())
        }
    }
}
