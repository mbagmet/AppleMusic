//
//  AppleMusicApp.swift
//  AppleMusic
//
//  Created by Михаил on 04.02.2022.
//

import SwiftUI

@main
struct AppleMusicApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(modelData)
        }
    }
}
