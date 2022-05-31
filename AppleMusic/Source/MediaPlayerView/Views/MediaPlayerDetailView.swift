//
//  MediaPlayerDetailView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 30.05.2022.
//

import SwiftUI

struct MediaPlayerDetailView: View {
    @Binding var showMediaPlayerDetail: Bool
    
    @State private var dragAmount = CGFloat.zero
    @State private var heightForAnimation = UIScreen.main.bounds.size.height / 3
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("topGray"), Color("centerGray"), Color("bottomDarkGray")]), startPoint: .top, endPoint: .bottom)

            VStack {
                Text("Hello, World!")
                    .onTapGesture {
                        withAnimation(.openCloseCover()) {
                            showMediaPlayerDetail.toggle()
                        }
                    }
                
                Spacer()
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        
        .offset(y: dragAmount)
        .gesture(
            DragGesture()
                .onChanged {
                    if $0.translation.height > 0 && showMediaPlayerDetail {
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
        MediaPlayerDetailView(showMediaPlayerDetail: .constant(false))
    }
}
