//
//  Radio.swift
//  AppleMusic
//
//  Created by Михаил on 13.02.2022.
//

import Foundation

struct Radio: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var description: String
    var imageName: String
    var isFavorite: Bool
}
