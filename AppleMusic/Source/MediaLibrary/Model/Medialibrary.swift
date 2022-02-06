//
//  Medialibrary.swift
//  AppleMusic
//
//  Created by Михаил on 06.02.2022.
//

import Foundation

struct Medialibrary: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var iconName: String
    var isChosen: Bool
}
