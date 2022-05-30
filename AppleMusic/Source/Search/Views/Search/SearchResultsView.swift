//
//  SearchResultsView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 30.05.2022.
//

import SwiftUI

struct SearchResultsView: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.isSearching) var isSearching
    
    @Binding var searchQuery: String
    @Binding var pickerSelection: String
    
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
            if !isSearching {
                CategorySearchView()
                
            } else {
                VStack(alignment: .leading) {
                    if searchQuery.isEmpty {
                        Picker.init("", selection: $pickerSelection) {
                            Text("Apple Music").tag("music")
                            Text("Ваша медиатека").tag("library")
                        }
                        .pickerStyle(.segmented)
                        
                        if lastSearchResults != [] {
                            HStack(alignment: .center) {
                                Text("Недавние поиски")
                                    .font(.subheadline)
                                    .fontWeight(.bold)

                                Spacer()

                                Button {
                                    lastSearchResults.removeAll()
                                } label: {
                                    Text("Очистить")
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                }

                            }
                            .padding(.top, 10)

                            Divider()
                        }
                    }
                    
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
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView(searchQuery: .constant(""), pickerSelection: .constant("music"))
            .environmentObject(ModelData())
    }
}
