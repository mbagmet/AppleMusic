//
//  SearchContainerView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 01.06.2022.
//

import SwiftUI

struct SearchContainerView: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var showMediaPlayerDetail: Bool
    
    @State var isSearching = false
    @State var searchQuery = ""
    @State var pickerSelection = "music"
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {           
                    SearchBar(isSearching: $isSearching, searchQuery: $searchQuery) {
                        if isSearching {
                            SearchResults(searchQuery: $searchQuery)
                        }
                    }
                    
                    if !isSearching {
                        SearchMain()
                    }
                }
                .navigationBarTitle("Поиск", displayMode: .large)
            }
            
            if !isSearching {
                MediaPlayerView(showMediaPlayerDetail: $showMediaPlayerDetail)
            }
        }
        
    }
}

struct SearcContainerView_Previews: PreviewProvider {
    static var previews: some View {
        SearchContainerView(showMediaPlayerDetail: .constant(false))
            .environmentObject(ModelData())
    }
}
