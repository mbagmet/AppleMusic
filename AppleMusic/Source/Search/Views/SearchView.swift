//
//  SearchView.swift
//  AppleMusic
//
//  Created by Михаил on 04.02.2022.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""

    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    CategorySearchView()
                }
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Радиостанции")
                .navigationBarTitle("Поиск", displayMode: .large)
            }
            .navigationViewStyle(.stack)

            MediaPlayerView()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
