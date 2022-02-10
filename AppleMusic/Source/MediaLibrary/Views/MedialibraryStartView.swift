//
//  MedialibraryStartView.swift
//  AppleMusic
//
//  Created by Михаил on 07.02.2022.
//

import SwiftUI

struct MedialibraryStartView: View {
    var body: some View {
        VStack(spacing: 5) {
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
}

struct MedialibraryStartView_Previews: PreviewProvider {
    static var previews: some View {
        MedialibraryStartView()
    }
}
