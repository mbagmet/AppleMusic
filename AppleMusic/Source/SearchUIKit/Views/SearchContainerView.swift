//
//  SearchContainerView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 01.06.2022.
//

import SwiftUI

struct SearchContainerView: View {
    @Binding var showMediaPlayerDetail: Bool
    
    var body: some View {
        ZStack {
            SearchViewController()
            
            MediaPlayerView(showMediaPlayerDetail: $showMediaPlayerDetail)
        }
        
    }
}

struct SearcContainerView_Previews: PreviewProvider {
    static var previews: some View {
        SearchContainerView(showMediaPlayerDetail: .constant(false))
    }
}
