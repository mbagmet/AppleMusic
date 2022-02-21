//
//  CategorySearchView.swift
//  AppleMusic
//
//  Created by Михаил on 17.02.2022.
//

import SwiftUI

struct CategorySearchView: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
            VStack(alignment: .leading) {
                Divider()

                Text("Поиск по категориям")
                    .font(.title2)
                    .bold()

                LazyVGrid(columns: columns) {
                    ForEach(1..<14) { index in
                        NavigationLink {
                            CategorySearchDetailView()
                        } label: {
                            Rectangle()
                                .frame(height: 150)
                                .foregroundColor(.yellow)
                        }
                    }
                }
            }
            .padding(.horizontal)
    }
}

struct CategorySearchView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySearchView()
    }
}
