//
//  NetworkManagerProtocol.swift
//  ArticlesList
//
//  Created by MacBooK Pro on 19/08/2024.
//

import Foundation

protocol NetworkManagerProtocol {
    func getRequest<T: Decodable>(urlString: String, responseType: T.Type) async throws -> T
}
