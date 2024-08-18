//
//  ArticleListViewControllerTest.swift
//  ArticlesListTests
//
//  Created by MacBooK Pro on 18/08/2024.
//

import XCTest
@testable import ArticlesList

final class ArticleListViewControllerTest: XCTestCase {
    
    var viewController: ArticleListViewController!
    
    override func setUp() {
        super.setUp()
        viewController = ArticleListViewController()
        viewController.loadViewIfNeeded()
    }
    
    func testTableViewLoadsArticles() async {
        // Ensure articles are loaded and table view displays them.
        let expectation = self.expectation(description: "testTableViewLoadsArticles")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5 , execute: {
            let cell = (self.viewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? ArticleCell)
            XCTAssertTrue(cell?.titleLbl.text == self.viewController.articles.first?.title)
            expectation.fulfill()
        })
        
        await fulfillment(of: [expectation], timeout: 5)
        
    }
}
