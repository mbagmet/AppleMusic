//
//  TopTapableLineView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 01.06.2022.
//

import SwiftUI

struct TopTapableLineView: View {
    
    @Binding var showMediaPlayerDetail: Bool
    
    var body: some View {
        HStack {            
            Capsule()
                .fill(Color.gray)
                .frame(width: 40, height: 5)
        }
        .onTapGesture {
            withAnimation(.openCloseCover()) {
                showMediaPlayerDetail.toggle()
            }
        }
    }
}

struct TopTapableLineView_Previews: PreviewProvider {
    static var previews: some View {
        TopTapableLineView(showMediaPlayerDetail: .constant(false))
    }
}
