//
//  FilmRequest.swift
//  TestProject
//
//  Created by Andrii Voitenko on 21.10.2021.
//

import Foundation

struct FilmRequest {
    let resourceURL: URL
    let API_KEY = "f910e2224b142497cc05444043cc8aa4"
    
    enum FilmError: Error {
        case noDataAvailable
        case canNotProcessData
    }
    
    init() {
        let resourceString = "https://api.themoviedb.org/3/movie/top_rated?api_key=\(API_KEY)&language=en-US&page=1"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }
    
    init(page:Int) {
        let resourceString = "https://api.themoviedb.org/3/movie/top_rated?api_key=\(API_KEY)&language=en-US&page=\(page)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }
    
    func getFilms(completion: @escaping (Result<Films, FilmError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let decoder = JSONDecoder()
                let filmsResponse = try decoder.decode(Films.self, from: jsonData)
                completion(.success(filmsResponse))
            } catch let error {
                print(error)
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
}
