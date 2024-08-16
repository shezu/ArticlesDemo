//
//  UITableView+Loading.swift
//  ArticlesList
//
//  Created by MacBooK Pro on 16/08/2024.
//

import Foundation
import UIKit

extension UITableView {
    func showLoadingFooter() {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 50))
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.center = footerView.center
        activityIndicator.startAnimating()
        footerView.addSubview(activityIndicator)
        self.tableFooterView = footerView
    }
    
    func hideLoadingFooter() {
        self.tableFooterView = nil
    }
}
