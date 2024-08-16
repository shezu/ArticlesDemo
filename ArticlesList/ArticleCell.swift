//
//  ArticleCell.swift
//  ArticlesList
//
//  Created by MacBooK Pro on 16/08/2024.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    static let placeholder = UIImage(named: "placeholder")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.layer.cornerRadius = imgView.frame.size.width / 2
    }

    func setupWith(article : Article) {
        if let thumbUrl = article.thumbUrl {
            self.imgView.loadImage(from: thumbUrl,
                                   placeholder: ArticleCell.placeholder)
        }else{
            self.imgView.image = ArticleCell.placeholder
        }
        self.titleLbl.text = article.title
        self.authorLbl.text = article.byline
        self.dateLbl.text = article.publishedDate
    }
}
