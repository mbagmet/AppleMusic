//
//  SearchCategory.swift
//  AppleMusic
//
//  Created by Михаил on 21.02.2022.
//

import Foundation

struct SearchCategory: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var imageName: String
    var items: [Search]?
}
