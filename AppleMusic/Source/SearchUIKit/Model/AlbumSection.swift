//
//  AlbumSection.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 02.06.2022.
//

enum AlbumSectionType: Decodable, Hashable {
    case featured
    case surroundedAudio
    case playlists
    case hotTracks
    case unknown(value: String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let status = try? container.decode(String.self)
        switch status {
              case "featured": self = .featured
              case "surroundedAudio": self = .surroundedAudio
              case "playlists": self = .playlists
              case "hotTracks": self = .hotTracks
              default:
                 self = .unknown(value: status ?? "unknown")
          }
    }
}

struct AlbumSection: Decodable, Hashable, Identifiable {
    var id: Int
    let type: AlbumSectionType
    let title: String?
    let items: [Album]
}
