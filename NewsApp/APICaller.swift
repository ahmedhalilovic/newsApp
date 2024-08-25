//
//  APICaller.swift
//  NewsApp
//
//  Created by Ahmed Halilovic on 18. 8. 2024..
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    struct Constants {
        static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2024-08-18&sortBy=publishedAt&apiKey=547bdc163baa4c888423e9e3d62f0314")
    }
    
    private init() {}
    
    public func getTopStories(completion: @escaping ( Result<[Article], Error>) -> Void) {
        guard let url = Constants.topHeadlinesURL else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                
                // We got data and now we try to decode data using JSONDecoder
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                        print("Articles: \(result.articles.count)")
                    completion(.success(result.articles))
                    }
                catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}

// Models

struct APIResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String?
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Codable {
    let name: String
}
