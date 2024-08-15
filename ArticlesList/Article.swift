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
    let uri: String
    let url: String
    let id, assetID: Int
    let source, publishedDate, updated, section: String
    let subsection, nytdsection, adxKeywords: String
    let column: String?
    let byline, type, title, abstract: String
    let desFacet: [String]
    let orgFacet, perFacet, geoFacet: [String]
    let media: [Media]
    let etaID: Int

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case column, byline, type, title, abstract
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaID = "eta_id"
    }
}

// MARK: - Media
struct Media: Codable {
    let type, subtype, caption, copyright: String
    let approvedForSyndication: Int
    let mediaMetadata: [MediaSubItem]

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaSubItem: Codable {
    let url: String
    let format: String
    let height, width: Int
}
