//
//  ArticleRepositoryTest.swift
//  ArticlesListTests
//
//  Created by MacBooK Pro on 17/08/2024.
//

import XCTest

import XCTest
@testable import ArticlesList

class ArticleRepositoryTests: XCTestCase {
    
    let repository: ArticleRepository = ArticleRepository(networkManager: NetworkManager.shared)
    
    func testFetchArticles() async {
        let expectation = self.expectation(description: "testFetchArticles")
        do {
            let articles = try await repository.fetchArticles()
            XCTAssertTrue(articles.count > 1)
            expectation.fulfill()
        } catch {
            XCTFail("Expected success but got error: \(error.localizedDescription)")
        }
        await fulfillment(of: [expectation], timeout: 5)
    }
}
