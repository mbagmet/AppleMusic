//
//  AlbumImageView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 31.05.2022.
//

import SwiftUI

struct AlbumImageView: View {
    @Binding var isPalying: Bool
    @Binding var showMediaPlayerDetail: Bool
    
    var body: some View {
        VStack(alignment: showMediaPlayerDetail ? .center : .leading) {
            Spacer()
            
            Image("song")
                .resizable()
                .scaledToFit()
                .frame(width: (isPalying ? .infinity : (showMediaPlayerDetail ? 240 : 120)),
                       height: (isPalying ? .infinity : (showMediaPlayerDetail ? 240 : 120)))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(color: Color("bottomDarkGray"), radius: 8, x: 0, y: 6)
            
            Spacer()
            
            HStack {
                Spacer()
            }
        }
    }
}

struct AlbumImageView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumImageView(isPalying: .constant(false), showMediaPlayerDetail: .constant(false))
    }
}
