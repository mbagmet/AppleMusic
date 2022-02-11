//
//  RadioSectionView.swift
//  AppleMusic
//
//  Created by Михаил on 10.02.2022.
//

import SwiftUI

struct RadioSectionView: View {

    var geometry: GeometryProxy

    let rows = [
        GridItem(.fixed(390))
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(0..<10) { index in
                    Rectangle()
                        .frame(width: geometry.size.width * 0.92)
                        .foregroundColor(.yellow)
                }
            }
            .padding([.leading, .trailing])
        }
    }
}

struct RadioSectionView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            RadioSectionView(geometry: geometry)
        }
    }
}
