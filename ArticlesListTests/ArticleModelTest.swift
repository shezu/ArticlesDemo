//
//  ArticleModelTest.swift
//  ArticlesListTests
//
//  Created by MacBooK Pro on 18/08/2024.
//

import XCTest
@testable import ArticlesList

final class ArticleModelTest: XCTestCase {

    func testArticleForPublishDateCorrect(){
        let article = Article(id: 1,
                              byline: "By Author",
                              publishedDate: "2024-08-10",
                              title: "Sample Article",
                              abstract: "",
                              media: [],
                              adx_keywords: "")
        
        XCTAssertEqual(article.date, "10-Aug-2024")
    }
    
    func testArticleForPublishDateInCorrect(){
        let article = Article(id: 1,
                              byline: "By Author",
                              publishedDate: "2024-08-10",
                              title: "Sample Article",
                              abstract: "",
                              media: [],
                              adx_keywords: "")
        
        XCTAssertNotEqual(article.date, "Aug-10-2024")
    }
    
    func testArticleForValidKeywords(){
        let article = Article(id: 1,
                              byline: "By Author",
                              publishedDate: "2024-08-10",
                              title: "Sample Article",
                              abstract: "",
                              media: [],
                              adx_keywords: "Tests (Medical);Cervical Cancer;Sexually Transmitted Diseases;Women and Girls;Cervix;Deaths (Fatalities);Black People;Cancer;Race and Ethnicity")
        
        XCTAssertEqual(article.keywords, "Tests (Medical), Cervical Cancer, Sexually Transmitted Diseases, Women and Girls, Cervix, Deaths (Fatalities), Black People, Cancer, Race and Ethnicity")
    }
}
