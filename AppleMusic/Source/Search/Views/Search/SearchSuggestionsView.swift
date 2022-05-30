//
//  SearchSuggestionsView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 30.05.2022.
//

import SwiftUI

struct SearchSuggestionsView: View {
    @EnvironmentObject var modelData: ModelData
    
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
                    .frame(height: 16)
                
                Text(suggestion.title)
                    //.padding(.bottom, 0)
                    .searchCompletion(suggestion.title)
            }
        }
    }
}

struct SearchSuggestionsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchSuggestionsView()
            .environmentObject(ModelData())
    }
}
