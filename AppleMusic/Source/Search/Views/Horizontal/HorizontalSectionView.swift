//
//  HorizontalSectionView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 08.03.2022.
//

import SwiftUI

struct HorizontalSectionView: View {
    @EnvironmentObject var modelData: ModelData
    
    var geometry: GeometryProxy
    
    @State var title: String
    @State var hasTwoRows = false

    let rows = [
        GridItem(.adaptive(minimum: 220, maximum: 320))
    ]
    
    let doubleRows = [
        GridItem(.flexible(minimum: 230, maximum: 320)),
        GridItem(.flexible(minimum: 230, maximum: 320))
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            HorizontalSectionTitleView(title: $title)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: hasTwoRows ? doubleRows : rows) {
                    ForEach(modelData.albums) { album in
                        HorizontalCellView(album: album)
                            .frame(width: geometry.size.width * 0.45)
                    }
                }
                .padding([.horizontal])
            }
        }
        .padding([.top])
    }
}

struct HorizontalSectionView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            HorizontalSectionView(geometry: geometry, title: "Пространственное аудио")
                .environmentObject(ModelData())
        }
    }
}
