//
//  VolumeView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 31.05.2022.
//

import SwiftUI

struct VolumeView: View {
    @State var volume = 45.0
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Image(systemName: "speaker.fill")
            Slider(value: $volume, in: 0...100)
            Image(systemName: "speaker.wave.3.fill")
        }
        .tint(Color("albumGrayBackground"))
        .foregroundColor(Color("albumGrayBackground"))
        .font(.caption2)
        .padding(.vertical, 30)
    }
}

struct VolumeView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeView()
    }
}
