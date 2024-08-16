//
//  Article.swift
//  ArticlesList
//
//  Created by MacBooK Pro on 15/08/2024.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let article = try? JSONDecoder().decode(Article.self, from: jsonData)

import Foundation

// MARK: - Article
struct Article: Codable {
    let id : Int
    let byline, publishedDate, title : String
    let media: [Media]

    enum CodingKeys: String, CodingKey {
        case id
        case publishedDate = "published_date"
        case byline, title
        case media
    }
}

// MARK: - Media
struct Media: Codable {
    let type, subtype, caption, copyright: String?
    let approvedForSyndication: Int?
    let mediaMetadata: [MediaMetaDataItem]
    
    init(type: String? = nil, subtype: String? = nil, caption: String? = nil, copyright: String? = nil, approvedForSyndication: Int? = nil, mediaMetadata: [MediaMetaDataItem]) {
        self.type = type
        self.subtype = subtype
        self.caption = caption
        self.copyright = copyright
        self.approvedForSyndication = approvedForSyndication
        self.mediaMetadata = mediaMetadata
    }

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetaDataItem: Codable {
    let url: String
    let format: String
    let height, width: Int
}
