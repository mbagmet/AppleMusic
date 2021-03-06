//
//  RadioSectionView.swift
//  AppleMusic
//
//  Created by Михаил on 10.02.2022.
//

import SwiftUI

struct RadioSectionView: View {
    @EnvironmentObject var modelData: ModelData

    var favoriteStations: [Radio] {
        modelData.radioItems.filter { radio in
            radio.isFavorite
        }
    }

    var geometry: GeometryProxy

    let rows = [
        GridItem(.adaptive(minimum: 280, maximum: 320))
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(favoriteStations) { radio in
                    RadioCellView(radio: radio)
                        .frame(width: geometry.size.width * 0.92)
                }
            }
            .padding([.horizontal])
        }
    }
}

struct RadioSectionView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            RadioSectionView(geometry: geometry)
                .environmentObject(ModelData())
        }
    }
}
