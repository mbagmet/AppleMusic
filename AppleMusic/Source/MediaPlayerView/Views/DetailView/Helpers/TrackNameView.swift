//
//  TrackNameView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 31.05.2022.
//

import SwiftUI

struct TrackNameView: View {
    var body: some View {
        HStack(spacing: 5) {
            VStack(alignment: .leading, spacing: 2) {
                Text("A Place for My Head Crawling In The End")
                    .fontWeight(.bold)
                    .foregroundColor(Color("dividerGray"))
                    .frame(height: 30)
                Text("Linkin Park")
                    .foregroundColor(Color("albumGrayBackground"))
            }
            .font(.title2)
            .lineLimit(1)

            Spacer()

            SongMenu()
        }
    }
}

struct TrackNameView_Previews: PreviewProvider {
    static var previews: some View {
        TrackNameView()
    }
}
