//
//  MedialibraryView.swift
//  AppleMusic
//
//  Created by Михаил on 04.02.2022.
//

import SwiftUI

struct MedialibraryView: View {
    @State var isEditMode = false

    var body: some View {
        ZStack {
            NavigationView {
                VStack(spacing: 5) {
                    if isEditMode {
                        MedialibraryListView()
                    } else {
                        Text("Ищете свою музыку?")
                            .font(.title)
                            .fontWeight(.bold)

                        Text("Здесь появится купленная Вами в \n iTunes Store музыка.")
                            .font(.title2)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)

                        Spacer()
                            .frame(height: 70)
                    }
                }
                .navigationTitle("Медиатека")
                .navigationBarItems(
                    trailing: Button(action: {
                        isEditMode.toggle()
                    }, label: {
                        Text(isEditMode ? "Готово" : "Править")
                    }))
            }
            .navigationViewStyle(.stack)

            MediaPlayerView()
        }
    }
}

struct MedialibraryView_Previews: PreviewProvider {
    static var previews: some View {
        MedialibraryView()
            .environmentObject(ModelData())
    }
}
