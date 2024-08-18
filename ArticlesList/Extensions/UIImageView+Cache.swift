//
//  ImageView+Cache.swift
//  ArticlesList
//
//  Created by MacBooK Pro on 16/08/2024.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(from url: URL, placeholder: UIImage? = nil) {
        self.image = placeholder
        let cacheKey = url.absoluteString
        if let cachedImage = ImageCache.shared.getImage(forKey: cacheKey) {
            self.image = cachedImage
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self, let data = data, let image = UIImage(data: data) else {
                return
            }
            ImageCache.shared.setImage(image, forKey: cacheKey)
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}
