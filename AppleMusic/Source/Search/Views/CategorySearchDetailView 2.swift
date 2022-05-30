//
//  CategorySearchDetailView.swift
//  AppleMusic
//
//  Created by Михаил on 21.02.2022.
//

import SwiftUI

struct CategorySearchDetailView: View {

    var category: SearchCategory

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                GeometryReader { geometry in
                    ScrollView(.vertical, showsIndicators: true) {
                        //FeaturedSectionView(geometry: geometry)
                    }
                }
            }
        }
        .navigationBarTitle(category.title)
        .navigationBarTitleDisplayMode(.large)
    }
}

struct CategorySearchDetailView_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        CategorySearchDetailView(category: modelData.searchCategories[0])
    }
}
