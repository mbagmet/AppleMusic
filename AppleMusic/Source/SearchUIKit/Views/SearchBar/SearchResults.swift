//
//  SearchResults.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 02.06.2022.
//

import SwiftUI

struct SearchResults: View {
    @EnvironmentObject var modelData: ModelData
    
    @Binding var searchQuery: String
    
    @State private var lastSearchResults = Set<Radio>()

    private var findedStations: [Radio] {
        if searchQuery.isEmpty {
            return Array(lastSearchResults)
        } else {
            return modelData.radioItems.filter {
                $0.title
                    .localizedCaseInsensitiveContains(searchQuery)
            }
        }
    }

    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                LazyVGrid(columns: columns) {
                    ForEach(findedStations) { station in
                        Button {
                            lastSearchResults.insert(station)
                        } label: {
                            StationsCellView(station: station, isSmall: true)
                                .padding(.bottom, 9)
                        }
                    }
                }
            }
            .padding(.top, 5)
            .padding(.horizontal)
        }
    }
}

struct SearchResults_Previews: PreviewProvider {
    static var previews: some View {
        SearchResults(searchQuery: .constant(""))
            .environmentObject(ModelData())
    }
}
