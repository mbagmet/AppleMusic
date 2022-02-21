//
//  CategorySearchDetailView.swift
//  AppleMusic
//
//  Created by Михаил on 21.02.2022.
//

import SwiftUI

struct CategorySearchDetailView: View {

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
        .navigationBarTitle("Рок")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct CategorySearchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySearchDetailView()
    }
}
