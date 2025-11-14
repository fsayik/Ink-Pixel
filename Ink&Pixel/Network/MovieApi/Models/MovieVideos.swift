//
//  MovieVideos.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 14.11.2025.
//

import Foundation

// MARK: - MovieVideos
struct MovieVideos: Codable {
    let id: Int?
    let results: [VideosResult]?
}

// MARK: - Result
struct VideosResult: Codable {
    let iso639_1: String?
    let iso3166_1: String?
    let name, key: String?
    let site: String?
    let size: Int?
    let type: String?
    let official: Bool?
    let publishedAt, id: String?

    enum CodingKeys: String, CodingKey {
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case name, key, site, size, type, official
        case publishedAt = "published_at"
        case id
    }
}
