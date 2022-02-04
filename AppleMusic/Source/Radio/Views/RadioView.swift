//
//  RadioView.swift
//  AppleMusic
//
//  Created by Михаил on 04.02.2022.
//

import SwiftUI

struct RadioView: View {
    var body: some View {
        NavigationView {
            Text("Радио")
                .navigationTitle("Радио")
        }
        .navigationViewStyle(.stack)

    }
}

struct RadioView_Previews: PreviewProvider {
    static var previews: some View {
        RadioView()
    }
}
