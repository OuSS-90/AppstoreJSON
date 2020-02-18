//
//  Service.swift
//  AppstoreJSON
//
//  Created by OuSS on 2/17/20.
//  Copyright © 2020 OuSS. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchITtunesApps(termString: String, completion: @escaping (Result<[ResultData],Error>) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(termString)&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let resData = try JSONDecoder().decode(AppSearchResult.self, from: data)
                completion(.success(resData.results))
            } catch let jsonError{
                completion(.failure(jsonError))
            }
        }.resume()
    }
}
