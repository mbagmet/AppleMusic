//
//  ContentView.swift
//  AppleMusic
//
//  Created by Михаил on 04.02.2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MedialibraryView()
                .tabItem {
                    Image(systemName: "square.stack.fill")
                    Text("Медиатека")
                }

            RadioView()
                .tabItem {
                    Image(systemName: "dot.radiowaves.left.and.right")
                    Text("Радио")
                }

            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Поиск")
                }
        }
        .accentColor(Color(#colorLiteral(red: 0.9918584228, green: 0.2413797379, blue: 0.2938711345, alpha: 1)))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
