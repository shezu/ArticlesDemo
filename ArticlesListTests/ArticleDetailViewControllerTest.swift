//
//  ArticleDetailViewControllerTest.swift
//  ArticlesListTests
//
//  Created by MacBooK Pro on 18/08/2024.
//

import XCTest
@testable import ArticlesList

final class ArticleDetailViewControllerTest: XCTestCase {

    var viewController: ArticleDetailViewController!
    let article = Article(id: 100000009620003,
                           byline: "By Danielle Friedman",
                           publishedDate: "2024-08-15",
                           title: "An Alternative to the Pap Smear Is Here, No Speculum Required",
                           abstract: "Starting this fall, women will be able to use a simple swab to screen for cervical cancer. The method offers an alternative to a procedure that many dread — and promises to address disparities in who develops the disease.",
                           media: [],
                           adx_keywords: "Tests (Medical);Cervical Cancer;Sexually Transmitted Diseases;Women and Girls;Cervix;Deaths (Fatalities);Black People;Cancer;Race and Ethnicity")

    
    override func setUp() {
        super.setUp()
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ArticleDetailViewController") as? ArticleDetailViewController
        viewController.article = self.article
        viewController.loadViewIfNeeded()
    }
    
    func testArticleIsDisplayingCorrectly(){
        XCTAssertTrue(viewController.titleLabel.text == article.title)
        XCTAssertTrue(viewController.authorLabel.text == article.byline)
        XCTAssertTrue(viewController.dateLabel.text == "Published Date: " + article.date)
        XCTAssertTrue(viewController.keywordsLbl.text == article.keywords)
        XCTAssertTrue(viewController.detailText.text == article.abstract)
    }

}
