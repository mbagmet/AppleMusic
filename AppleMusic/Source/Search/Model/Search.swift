//
//  Search.swift
//  AppleMusic
//
//  Created by Михаил on 21.02.2022.
//

import Foundation

struct Search: Hashable, Codable, Identifiable {
    var id: Int
    var titleDescription: String
    var title: String
    var author: String?
    var description: String
    var imageName: String?
    var smallImageName: String?
    var isFavorite: Bool
}
