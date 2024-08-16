//
//  ArticleRepositoryTest.swift
//  ArticlesListTests
//
//  Created by MacBooK Pro on 17/08/2024.
//

import XCTest

import XCTest
@testable import ArticlesList

// Mock Network Manager
class MockNetworkManager: NetworkManagerProtocol {
    
    var shouldReturnError = false
    var mockResponse: ArticleResponseModel?
    
    func getRequest<T>(urlString: String, responseType: T.Type) async throws -> T where T : Decodable {
        if shouldReturnError {
            throw NetworkError.requestFailed
        } else if let mockResponse = mockResponse as? T {
            return mockResponse
        } else {
            throw NetworkError.unknown
        }
    }
}

// Test Case for ArticleRepository
class ArticleRepositoryTests: XCTestCase {
    
    var articleRepository: ArticleRepository!
    var mockNetworkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        articleRepository = ArticleRepository(networkManager: mockNetworkManager)
    }
    
    override func tearDown() {
        articleRepository = nil
        mockNetworkManager = nil
        super.tearDown()
    }
    
    // Test for successful fetch
    func testFetchArticlesSuccess() async {
        // Arrange
        let mockArticles = [Article(id: 1, byline: "By Author", publishedDate: "2024-08-10", title: "Sample Article", media: [])]
        let mockResponse = ArticleResponseModel(results: mockArticles)
        mockNetworkManager.mockResponse = mockResponse
        
        // Act
        do {
            let articles = try await articleRepository.fetchArticles()
            
            // Assert
            XCTAssertEqual(articles.count, 1)
            XCTAssertEqual(articles.first?.title, "Sample Article")
        } catch {
            XCTFail("Expected success but got error: \(error.localizedDescription)")
        }
    }
    
    // Test for network error
    func testFetchArticlesNetworkError() async {
        // Arrange
        mockNetworkManager.shouldReturnError = true
        
        // Act & Assert
        do {
            _ = try await articleRepository.fetchArticles()
            XCTFail("Expected error but got success")
        } catch {
            XCTAssertEqual(error as? NetworkError, NetworkError.requestFailed)
        }
    }
}
