//
//  CategorySearchView.swift
//  AppleMusic
//
//  Created by Михаил on 17.02.2022.
//

import SwiftUI

struct CategorySearchView: View {
    @EnvironmentObject var modelData: ModelData
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Divider()

            Text("Поиск по категориям")
                .font(.title2)
                .bold()

            LazyVGrid(columns: columns) {
                ForEach(modelData.searchCategories) { category in
                    NavigationLink {
                        CategorySearchDetailView(category: category)
                    } label: {
                        ZStack(alignment: .bottomLeading) {
                            Image(category.imageName)
                                .resizable()
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 5))

                            Text(category.title)
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal)
                                .padding(.vertical, 10)
                        }

                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 90)
    }
}

struct CategorySearchView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySearchView()
            .environmentObject(ModelData())
    }
}
