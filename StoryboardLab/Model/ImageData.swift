//
//  ImageData.swift
//  StoryboardLab
//
//  Created by Gagandeep Dass Kaur on 27/2/25.
//

import Foundation

struct ImageData: Codable {
    let sprites: Sprites
}

// MARK: - Sprites
class Sprites: Codable {
    let other: Other?

    init(other: Other?) {
        self.other = other
    }
}


// MARK: - Other
struct Other: Codable {
    let officialArtwork: OfficialArtwork?

    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

// MARK: - OfficialArtwork
struct OfficialArtwork: Codable {
    let frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
