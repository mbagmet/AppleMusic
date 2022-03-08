//
//  Album.swift
//  AppleMusic
//
//  Created by Михаил on 21.02.2022.
//

import Foundation

struct Album: Hashable, Codable, Identifiable {
    var id: Int
    var titleDescription: String
    var title: String
    var author: String?
    var description: String
    var imageName: String
    var smallImageName: String
    var isFeatured: Bool
    //var searchCategory: [SearchCategory]
}
