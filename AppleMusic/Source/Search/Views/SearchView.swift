//
//  SearchView.swift
//  AppleMusic
//
//  Created by Михаил on 04.02.2022.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationView {
            Text("Поиск")
                .navigationTitle("Поиск")
        }
        .navigationViewStyle(.stack)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
