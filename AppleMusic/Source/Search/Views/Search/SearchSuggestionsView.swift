//
//  SearchSuggestionsView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 30.05.2022.
//

import SwiftUI

struct SearchSuggestionsView: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var searchQuery: String
    
    private var suggestions: [Radio] {
        modelData.radioItems.filter { radio in
            radio.isFavorite
        }
    }
    
    var body: some View {
        ForEach(suggestions) { suggestion in
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 17)
                    .foregroundColor(Color("AccentColor"))
                
                Button(suggestion.title) {
                    searchQuery = suggestion.title
                }
            }
            .padding(.horizontal, 12)
            .padding(.top, 3)
        }
    }
}

struct SearchSuggestionsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchSuggestionsView(searchQuery: .constant(""))
            .environmentObject(ModelData())
    }
}
