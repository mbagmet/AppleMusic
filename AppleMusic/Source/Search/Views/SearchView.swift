//
//  SearchView.swift
//  AppleMusic
//
//  Created by Михаил on 04.02.2022.
//

import SwiftUI

struct SearchView: View {
    @Binding var showMediaPlayerDetail: Bool
    
    @State var isSearching = false
    @State var searchQuery = ""
    @State var pickerSelection = "music"

    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    SearchResultsView(searchQuery: $searchQuery, pickerSelection: $pickerSelection)
                }
                .navigationBarTitle("Поиск", displayMode: .large)
            }
            .navigationViewStyle(.stack)
            
            .searchable(text: $searchQuery,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: (pickerSelection == "music" ? "Радиостанции" : "Ваша медиатека")) {
                
                if searchQuery == "" {
//                    SearchSuggestionsView()
                }
            }

            MediaPlayerView(showMediaPlayerDetail: $showMediaPlayerDetail)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(showMediaPlayerDetail: .constant(false))
            .environmentObject(ModelData())
    }
}
