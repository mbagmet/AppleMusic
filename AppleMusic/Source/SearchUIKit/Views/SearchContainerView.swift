//
//  SearchContainerView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 01.06.2022.
//

import SwiftUI

struct SearchContainerView: View {
    @Binding var showMediaPlayerDetail: Bool
    
    @State var searchQuery = ""
    @State var pickerSelection = "music"
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    SearchBar(searchQuery: $searchQuery) {
                        SearchResults(searchQuery: $searchQuery)
                    }
                    .navigationBarTitle("Поиск", displayMode: .large)
                    
                    //SearchViewController()
                }
                
                
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
