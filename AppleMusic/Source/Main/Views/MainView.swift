//
//  ContentView.swift
//  AppleMusic
//
//  Created by Михаил on 04.02.2022.
//

import SwiftUI

struct MainView: View {
    @State var showMediaPlayerDetail = false
    
    @State private var screenHeight = UIScreen.main.bounds.size.height
    @State var dragAmount = CGFloat.zero
    
    var body: some View {
        ZStack {
            TabView {
                MedialibraryView(showMediaPlayerDetail: $showMediaPlayerDetail)
                    .tabItem {
                        Image("library")
                            .renderingMode(.template)
                        Text("Медиатека")
                    }

                RadioView(showMediaPlayerDetail: $showMediaPlayerDetail)
                    .tabItem {
                        Image(systemName: "dot.radiowaves.left.and.right")
                        Text("Радио")
                    }

                SearchView(showMediaPlayerDetail: $showMediaPlayerDetail)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Поиск")
                    }
                
                SearchContainerView(showMediaPlayerDetail: $showMediaPlayerDetail)
                    .tabItem {
                        Image(systemName: "text.magnifyingglass")
                        Text("UIKit")
                    }
            }

            MediaPlayerDetailView(showMediaPlayerDetail: $showMediaPlayerDetail, dragAmount: $dragAmount)
            .offset(y: showMediaPlayerDetail ? dragAmount : screenHeight)
        } 
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ModelData())
    }
}
