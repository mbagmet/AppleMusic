//
//  MediaPlayerDetailView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 30.05.2022.
//

import SwiftUI

struct MediaPlayerDetailView: View {
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    @Binding var showMediaPlayerDetail: Bool
    
    @Binding var dragAmount: CGFloat
    @State private var heightForAnimation = UIScreen.main.bounds.size.height / 3
    
    @State var isPlaying = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("topGray"), Color("centerGray"), Color("bottomDarkGray")]), startPoint: .top, endPoint: .bottom)

            VStack {
                TopTapableLineView(showMediaPlayerDetail: $showMediaPlayerDetail)
                AlbumImageView(isPalying: $isPlaying, showMediaPlayerDetail: $showMediaPlayerDetail)
                TrackNameView()
                SongTimelineView()
                PlaybackButtonsView(isPlaying: $isPlaying)
                VolumeView()
                AdditionalButtonsView()
                Spacer()
            }
            .padding(safeAreaInsets)
            .padding(.horizontal, 30)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        
        
        .offset(y: dragAmount)
        .gesture(
            DragGesture()
                .onChanged {
                    if $0.translation.height > 20 && showMediaPlayerDetail {
                        dragAmount = $0.translation.height
                    }
                }
                .onEnded {
                    if $0.translation.height > heightForAnimation && showMediaPlayerDetail {
                        withAnimation(.openCloseCover()) {
                            showMediaPlayerDetail.toggle()
                        }
                        dragAmount = .zero
                    } else {
                        withAnimation(.openCloseCover()) {
                            dragAmount = .zero
                        }
                    }
                    
                }
        )
        .animation(.openCloseCover(), value: dragAmount)
    }
}

struct MediaPlayerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPlayerDetailView(showMediaPlayerDetail: .constant(false), dragAmount: .constant(CGFloat.zero))
    }
}
