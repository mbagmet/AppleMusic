//
//  SearchContainerView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 01.06.2022.
//

import SwiftUI

struct SearchContainerView: View {
    @Binding var showMediaPlayerDetail: Bool
    
    @State var isSearching = false
    @State var searchQuery = ""
    @State var pickerSelection = "music"
    
    var body: some View {
        ZStack {
            NavigationView {
                SearchBar(isSearching: $isSearching, searchQuery: $searchQuery) {
                    if isSearching {
                        SearchResults(searchQuery: $searchQuery)
                    } else {
                        SearchViewController()
                            .ignoresSafeArea()
                    }
                    
                }
                .navigationBarTitle("Поиск", displayMode: .large)
            }
            MediaPlayerView(showMediaPlayerDetail: $showMediaPlayerDetail)
        }
        
    }
}

struct SearcContainerView_Previews: PreviewProvider {
    static var previews: some View {
        SearchContainerView(showMediaPlayerDetail: .constant(false))
    }
}
