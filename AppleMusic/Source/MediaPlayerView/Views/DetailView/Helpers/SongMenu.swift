//
//  SongMenu.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 31.05.2022.
//

import SwiftUI

struct SongMenu: View {
    var body: some View {
        Menu {
            Section {
                Button {

                } label: {
                    Label("Предлагать меньше похожих", systemImage: "hand.thumbsdown")
                }
                Button {

                } label: {
                    Label("Нравится", systemImage: "heart")
                }
            }
            
            Section {
                Button {

                } label: {
                    Label("Показать альбом", systemImage: "music.note")
                }
                Button {

                } label: {
                    Label("Поделиться песней", systemImage: "square.and.arrow.up")
                }
            }
            
            Section {
                Button {

                } label: {
                    Label("Добавить в плейлист", systemImage: "text.badge.plus")
                }
                Button {

                } label: {
                    Label("Загрузить", systemImage: "arrow.down.circle")
                }
                Button {

                } label: {
                    Label("Удалить из Медиатеки", systemImage: "trash")
                }
            }
            
        } label: {
            Image(systemName: "ellipsis.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(Color("topGray"))
                .background(
                    Color("dividerGray")
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                )
        }
        .accentColor(.primary)
    }
}

struct SongMenu_Previews: PreviewProvider {
    static var previews: some View {
        SongMenu()
    }
}
