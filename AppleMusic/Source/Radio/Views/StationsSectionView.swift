//
//  StationsSectionView.swift
//  AppleMusic
//
//  Created by Михаил on 10.02.2022.
//

import SwiftUI

struct StationsSectionView: View {

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
                ForEach(0..<10) { index in
                    StationsCellView()
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
    }
}
