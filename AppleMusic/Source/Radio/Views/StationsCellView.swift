//
//  StationsCellView.swift
//  AppleMusic
//
//  Created by Михаил on 12.02.2022.
//

import SwiftUI

struct StationsCellView: View {
    @EnvironmentObject var modelData: ModelData
    var station: Radio

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(station.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)

            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(station.title)
                            .foregroundColor(.primary)
                        Text(station.description)
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }

                    Spacer()

                    ShareStationMenu()
                }
                .frame(height: 109)

                Divider()
                    .background(Color("dividerGray"))
            }
            .frame(height: 110)
        }
    }
}

struct StationsCellView_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        StationsCellView(station: modelData.radioItems[6])
    }
}
