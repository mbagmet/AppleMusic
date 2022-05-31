//
//  MedialibraryView.swift
//  AppleMusic
//
//  Created by Михаил on 04.02.2022.
//

import SwiftUI

struct MedialibraryView: View {
    @State var isEditMode = false
    @Binding var showMediaPlayerDetail: Bool

    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    if isEditMode {
                        MedialibraryListView()
                    } else {
                        MedialibraryStartView()
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

            MediaPlayerView(showMediaPlayerDetail: $showMediaPlayerDetail)
        }
    }
}

struct MedialibraryView_Previews: PreviewProvider {
    static var previews: some View {
        MedialibraryView(showMediaPlayerDetail: .constant(false))
            .environmentObject(ModelData())
    }
}
