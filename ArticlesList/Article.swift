//
//  Article.swift
//  ArticlesList
//
//  Created by MacBooK Pro on 15/08/2024.
//

import Foundation

// MARK: - Article
struct Article: Codable {
    let id : Int
    let byline, publishedDate, title, abstract : String
    let media: [Media]
    let adx_keywords: String
    
    var thumbUrl : URL? {
        if let urlStr = media.first(where: { $0.type == "image"})?.mediaMetadata.first?.url ,
           let url = URL(string: urlStr) {
            return url
        }
        return nil
    }
    var imageUrl : URL? {
        if let urlStr = media.first(where: { $0.type == "image"})?.mediaMetadata.last?.url ,
           let url = URL(string: urlStr) {
            return url
        }
        return nil
    }
    var date : String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: publishedDate) {
            formatter.dateStyle = .medium
            return formatter.string(from: date)
        }
        return publishedDate
    }
    var keywords : String {
        return adx_keywords.replacingOccurrences(of: ";", with: ", ")
    }

    enum CodingKeys: String, CodingKey {
        case id
        case publishedDate = "published_date"
        case byline, title, abstract
        case media
        case adx_keywords
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
