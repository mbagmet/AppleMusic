//
//  HorizontalSectionTitleView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 29.04.2022.
//

import SwiftUI

struct HorizontalSectionTitleView: View {
    @Binding var title: String
    
    var body: some View {
        VStack{
            Divider()
                .background(Color("dividerGray"))
                .padding([.horizontal])

            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button("См. все") {
                    // ToDo
                }
            }
            .padding([.horizontal])
        }
    }
}

struct HorizontalSectionTitleView_Previews: PreviewProvider {
    @State static var title: String = "Пространственное аудио"
    
    static var previews: some View {
        HorizontalSectionTitleView(title: $title)
    }
}
