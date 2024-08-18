//
//  NetworkManager.swift
//  ArticlesList
//
//  Created by MacBooK Pro on 16/08/2024.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case requestFailed
    case decodingFailed
    case unknown
}

class NetworkManager : NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    private init(){}
    
    func getRequest<T: Decodable>(urlString: String, responseType: T.Type) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.requestFailed
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(responseType, from: data)
            return decodedResponse
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
