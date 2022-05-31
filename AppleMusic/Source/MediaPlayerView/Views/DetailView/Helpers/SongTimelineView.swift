//
//  SongTimelineView.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 31.05.2022.
//

import SwiftUI

struct SongTimelineView: View {
    @State var currentTime = 0.0
    @State var duration = 184.0
    
    var body: some View {
        VStack {
            Slider(value: $currentTime, in: 0...duration, step: 1)
                .tint(Color("albumGrayBackground"))
                
            HStack {
                Text(formatTime(currentTime))
                Spacer()
                Text("-\(formatTime(duration - currentTime))")
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
    }
}

struct SongTimelineView_Previews: PreviewProvider {
    static var previews: some View {
        SongTimelineView()
    }
}

extension SongTimelineView {
    private func formatTime(_ time: Double) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60

        return String(format:"%01i:%02i", minutes, seconds)
    }
}
