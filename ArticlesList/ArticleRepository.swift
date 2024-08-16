//
//  ArticleRepository.swift
//  ArticlesList
//
//  Created by MacBooK Pro on 16/08/2024.
//

import Foundation

class ArticleResponseModel : Codable {
    let results : [Article]
    
    init(results: [Article]) {
        self.results = results
    }
}

class ArticleRepository: ArticleRepositoryProtocol {
    
    private let networkManager : NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchArticles() async throws -> [Article] {
        let urlString = "https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json?api-key=ZAOOuyNmlnVc0T2emgWlB4JJM5ApNza8"
        let resp = try await networkManager.getRequest(urlString: urlString, responseType: ArticleResponseModel.self)
        return resp.results
    }
}
