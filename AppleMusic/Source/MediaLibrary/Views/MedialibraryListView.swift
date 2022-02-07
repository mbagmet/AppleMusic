//
//  MedialibraryListView.swift
//  AppleMusic
//
//  Created by Михаил on 06.02.2022.
//

import SwiftUI

struct MedialibraryListView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var multiSelection = Set<Int>()

    var body: some View {
        List(selection: $multiSelection) {
            ForEach(modelData.libraryList) { libraryItem in
                MedialibraryRowView(libraryItem: libraryItem)
            }
            .onMove(perform: moveListRow)
        }
        .listStyle(.plain)
        .environment(\.editMode, .constant(.active))
    }

    func moveListRow(from source: IndexSet, to destination: Int) {
        modelData.libraryList.move(fromOffsets: source, toOffset: destination)
    }
}

struct MedialibraryListView_Previews: PreviewProvider {
    static var previews: some View {
        MedialibraryListView()
            .environmentObject(ModelData())
    }
}
