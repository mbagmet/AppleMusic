//
//  HorizontalCellView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 08.03.2022.
//

import SwiftUI

struct HorizontalCellView: View {
    @EnvironmentObject var modelData: ModelData
    var album: Album
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(album.smallImageName)
                .resizable()
                .scaledToFit()
            
            Text(album.title)
                .foregroundColor(.primary)
                .font(.caption)
            
            if let author = album.author {
                Text(author)
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
        }
        .lineLimit(1)
    }
}

struct HorizontalCellView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        HorizontalCellView(album: modelData.albums[0])
    }
}
