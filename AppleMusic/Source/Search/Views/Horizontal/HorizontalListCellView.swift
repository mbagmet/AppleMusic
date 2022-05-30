//
//  HorizontalListCellView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 29.04.2022.
//

import SwiftUI

struct HorizontalListCellView: View {
    @EnvironmentObject var modelData: ModelData
    var album: Album
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(album.smallImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 46, height: 46)
                .padding(.top, 5)

            VStack {
                Divider()
                    .background(Color("dividerGray"))
                
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(album.title)
                            .foregroundColor(.primary)
                        
                        if let author = album.author {
                            Text(author)
                                .foregroundColor(.secondary)
                                .font(.caption)
                        }
                    }

                    Spacer()

                    ShareAlbumMenu()
                        .padding(.trailing)
                }
                .frame(maxHeight: .infinity)
            }
            .frame(height: 46)
        }
    }
}

struct HorizontalListCellView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        HorizontalListCellView(album: modelData.albums[0])
    }
}
