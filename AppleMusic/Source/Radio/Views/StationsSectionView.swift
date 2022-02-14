//
//  StationsSectionView.swift
//  AppleMusic
//
//  Created by Михаил on 10.02.2022.
//

import SwiftUI

struct StationsSectionView: View {
    @EnvironmentObject var modelData: ModelData

    var defaultStations: [Radio] {
        modelData.radioItems.filter { radio in
            !radio.isFavorite
        }
    }

    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
                .background(Color("dividerGray"))

            Text("Станции")
                .font(.title2)
                .fontWeight(.bold)

            LazyVGrid(columns: columns) {
                ForEach(defaultStations) { station in
                    StationsCellView(station: station)
                        .padding(.bottom, 9)
                }
            }
        }
        .padding([.top, .leading, .trailing])
    }
}

struct StationsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        StationsSectionView()
            .environmentObject(ModelData())
    }
}
