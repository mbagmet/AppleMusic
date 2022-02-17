//
//  RadioCellView.swift
//  AppleMusic
//
//  Created by Михаил on 11.02.2022.
//

import SwiftUI

struct RadioCellView: View {
    @EnvironmentObject var modelData: ModelData
    var radio: Radio
    
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
                .background(Color("dividerGray"))

            Text("Избранная радиостанция")
                .foregroundColor(.secondary)
                .textCase(.uppercase)
                .font(.caption2)
            Text(radio.title)
                .foregroundColor(.primary)
                .font(.title3)
            Text(radio.description)
                .foregroundColor(.secondary)
                .font(.title3)
                .padding(.bottom, -1)

            ZStack(alignment: .bottomLeading) {
                Image(radio.imageName)
                    .resizable()
                    .scaledToFit()

                Text(radio.description)
                    .font(.caption)
                    .padding(8)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .bottomLeading)
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
    static let modelData = ModelData()

    static var previews: some View {
        RadioCellView(radio: modelData.radioItems[0])
    }
}
