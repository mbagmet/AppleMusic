//
//  SearchDetailContainer.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 05.06.2022.
//

import SwiftUI

struct SearchDetailContainer: View {
    @EnvironmentObject var modelData: ModelData
    @State var title: String
    
    var body: some View {
        SearchDetail()
            .navigationBarTitle(title, displayMode: .large)
        
    }
}

struct SearchDetailContainer_Previews: PreviewProvider {
    static var previews: some View {
        SearchDetailContainer(title: "Пространственное аудио")
            .environmentObject(ModelData())
    }
}
