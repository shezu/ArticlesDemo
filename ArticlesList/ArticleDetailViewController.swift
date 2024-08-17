//
//  ArticleDetailViewController.swift
//  ArticlesList
//
//  Created by MacBooK Pro on 17/08/2024.
//

import UIKit

class ArticleDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var detailText: UILabel!
    @IBOutlet weak var keywordsLbl: UILabel!
    
    var article : Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        showArticleData()
    }
    
    func setupView(){
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        authorLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        dateLabel.textColor = .gray
        dateLabel.font = UIFont.systemFont(ofSize: 14)
        
        detailText.textColor = .gray
        detailText.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        keywordsLbl.font = UIFont.systemFont(ofSize: 14)
        
        imgView.layer.cornerRadius = 16
    }

    func showArticleData(){
        guard let article = article else {return}
        
        titleLabel.text = article.title
        authorLabel.text = article.byline
        detailText.text = article.abstract
        if let imageUrl = article.imageUrl {
            imgView.loadImage(from: imageUrl,
                              placeholder: ArticleCell.placeholder)
        }
        dateLabel.text = "Published Date: " + article.date
        keywordsLbl.text = article.keywords
    }
    
    
}
