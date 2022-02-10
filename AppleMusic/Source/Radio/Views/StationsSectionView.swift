//
//  StationsSectionView.swift
//  AppleMusic
//
//  Created by Михаил on 10.02.2022.
//

import SwiftUI

struct StationsSectionView: View {

    var geometry: GeometryProxy

    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            Divider()
                .padding([.top, .leading, .trailing])

            Text("Станции")
                .font(.title2)
                .fontWeight(.bold)
                .frame(width: geometry.size.width - 32, alignment: .leading)

            LazyVGrid(columns: columns) {
                ForEach(0..<10) { index in
                    Rectangle()
                        .frame(height: 150)
                        .foregroundColor(.green)
                }
            }
            .padding([.leading, .trailing])
        }
    }
}

struct StationsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            StationsSectionView(geometry: geometry)
        }
    }
}
