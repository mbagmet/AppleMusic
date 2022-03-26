//
//  FeaturedCellView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 07.03.2022.
//

import SwiftUI

struct FeaturedCellView: View {
    @EnvironmentObject var modelData: ModelData
    var album: Album
    
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
                .background(Color("dividerGray"))

            Text(album.titleDescription)
                .foregroundColor(.secondary)
                .textCase(.uppercase)
                .font(.caption2)
            Text(album.title)
                .foregroundColor(.primary)
                .font(.title3)
            
            if let author = album.author {
                Text(author)
                    .foregroundColor(.secondary)
                    .font(.title3)
                    .padding(.bottom, -1)
            }

            ZStack(alignment: .bottomLeading) {
                Image(album.imageName)
                    .resizable()
                    .scaledToFit()

                Text(album.description)
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

struct FeaturedCellView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        FeaturedCellView(album: modelData.albums[0])
    }
}
