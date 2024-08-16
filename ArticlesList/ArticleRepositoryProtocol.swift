//
//  ArticleRepositoryProtocol.swift
//  ArticlesList
//
//  Created by MacBooK Pro on 15/08/2024.
//

import Foundation

protocol ArticleRepositoryProtocol {
    func fetchArticles() async throws -> [Article] 
}
