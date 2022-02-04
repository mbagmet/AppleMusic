//
//  MedialibraryView.swift
//  AppleMusic
//
//  Created by Михаил on 04.02.2022.
//

import SwiftUI

struct MedialibraryView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 5) {
                Text("Ищете свою музыку?")
                    .font(.title)
                    .fontWeight(.bold)

                Text("Здесь появится купленная Вами в \n iTunes Store музыка.")
                    .font(.title2)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .navigationTitle("Медиатека")
            .navigationBarItems(trailing: NavigationLink("Править", destination: RadioView()))
        }
        .navigationViewStyle(.stack)

    }
}

struct MedialibraryView_Previews: PreviewProvider {
    static var previews: some View {
        MedialibraryView()
    }
}
