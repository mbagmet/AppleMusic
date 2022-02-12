//
//  StationsCellView.swift
//  AppleMusic
//
//  Created by Михаил on 12.02.2022.
//

import SwiftUI

struct StationsCellView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image("station1")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)

            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Тренды Металла")
                            .foregroundColor(.primary)
                        Text("Станция Apple Music")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }

                    Spacer()

                    ShareStationMenu()
                }
                .frame(height: 109)

                Divider()
            }
            .frame(height: 110)
        }
    }
}

struct StationsCellView_Previews: PreviewProvider {
    static var previews: some View {
        StationsCellView()
    }
}
