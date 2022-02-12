//
//  RadioCellView.swift
//  AppleMusic
//
//  Created by Михаил on 11.02.2022.
//

import SwiftUI

struct RadioCellView: View {
    var geometry: GeometryProxy
    
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
                .background(Color("dividerGray"))

            Text("Избранная радиостанция")
                .foregroundColor(.secondary)
                .textCase(.uppercase)
                .font(.caption2)
            Text("Хиты на русском")
                .foregroundColor(.primary)
                .font(.title3)
            Text("Станция Apple Music")
                .foregroundColor(.secondary)
                .font(.title3)
                .padding(.bottom, -1)

            ZStack(alignment: .bottomLeading) {
                Image("radio2")
                    .resizable()
                    .scaledToFit()

                Text("Станция Apple Music")
                    .font(.caption)
                    .padding(8)
                    .foregroundColor(.white)
                    .frame(width: geometry.size.width * 0.92, alignment: .bottomLeading)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color("darkGray"), .black]), startPoint: .top, endPoint: .bottom)
                            .opacity(0.5)
                        )
                    .shadow(color: .black, radius: 8, x: 0, y: -5)

            }
            .clipped()
        }

    }
}

struct RadioCellView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            RadioCellView(geometry: geometry)
        }
    }
}
