//
//  CategorySearchDetailView.swift
//  AppleMusic
//
//  Created by Михаил on 21.02.2022.
//

import SwiftUI

struct CategorySearchDetailView: View {
    @EnvironmentObject var modelData: ModelData

    var category: SearchCategory

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                GeometryReader { geometry in
                    ScrollView(.vertical, showsIndicators: true) {
                        FeaturedSectionView(geometry: geometry)
                        HorizontalSectionView(geometry: geometry)
                        HorizontalSectionView(geometry: geometry, hasTwoRows: true)
                    }
                }
            }
            .navigationBarTitle(category.title)
            .navigationBarTitleDisplayMode(.large)
            .padding(.bottom, 80)

            MediaPlayerView()
        }
    }
}

struct CategorySearchDetailView_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        CategorySearchDetailView(category: modelData.searchCategories[0])
            .environmentObject(ModelData())
    }
}
