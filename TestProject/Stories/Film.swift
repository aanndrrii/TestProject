//
//  Film.swift
//  TestProject
//
//  Created by Andrii Voitenko on 21.10.2021.
//

import Foundation

struct Film: Decodable {
    
    let adult: Bool
    let backdrop_path: String
    let genre: [Int]
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Float
    let poster_path: String
    let release_date: String
    let title: String
    let video: Bool
    let vote_average: Float
    let vote_count: Int
}

struct Films: Decodable {
    
    let page: Int
    var films: [Film]
    var total_pages: Int
    var total_results: Int
    
    init(){
        page = 0
        films = [Film]()
        total_pages = 0
        total_results = 0
    }
}
