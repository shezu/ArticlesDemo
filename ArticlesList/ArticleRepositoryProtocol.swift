//
//  ArticleRepositoryProtocol.swift
//  ArticlesList
//
//  Created by MacBooK Pro on 15/08/2024.
//

import Foundation

protocol ArticleRepository {
    func fetchArticles(completion: @escaping (Result<[Article], Error>) -> Void)
    func saveArticles(_ articles: [Article], completion: @escaping (Result<Void, Error>) -> Void)
    func getSavedArticles() -> [Article]
}
