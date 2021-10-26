//
//  Film.swift
//  TestProject
//
//  Created by Andrii Voitenko on 21.10.2021.
//

import Foundation

struct Film: Decodable {
    
    let adult: Bool
    let backdropPath: String
    let genre: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Float
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Float
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case genre = "genre_ids"
        case id = "id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        
    }
}

struct Films: Decodable {
    
    let page: Int
    var films: [Film]
    var totalPages: Int
    var totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case films = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    init(){
        page = 0
        films = [Film]()
        totalPages = 0
        totalResults = 0
    }
}
