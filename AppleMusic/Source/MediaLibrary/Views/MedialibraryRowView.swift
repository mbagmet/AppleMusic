//
//  MedialibraryRowView.swift
//  AppleMusic
//
//  Created by Михаил on 07.02.2022.
//

import SwiftUI

struct MedialibraryRowView: View {
    var libraryItem: Medialibrary
    
    var body: some View {
        HStack {
            Image(systemName: libraryItem.iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 29, height: 23)
                .foregroundColor(Color("AccentColor"))

            Text(libraryItem.name)
                .font(.title3)
                .padding([.top, .bottom], 8)
        }
        .listRowBackground(Color.primary.colorInvert())
    }
}

struct MedialibraryRowView_Previews: PreviewProvider {
    static var libraryList = ModelData().libraryList

    static var previews: some View {
        Group {
            MedialibraryRowView(libraryItem: libraryList[0])
            MedialibraryRowView(libraryItem: libraryList[5])
        }
        .previewLayout(.fixed(width: 300, height: 50))
    }
}
