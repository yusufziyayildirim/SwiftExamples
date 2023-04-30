//
//  MovieDetail.swift
//  MovieAppSwiftUI
//
//  Created by Yusuf Ziya YILDIRIM on 30.04.2023.
//

import Foundation

struct MovieDetail : Codable {
    let imdbId: String
    let title: String
    let year: String
    let genre: String
    let director: String
    let writer: String
    let actors: String
    let plot: String
    let awards: String
    let poster: String
    let metaScore: String
    let imdbRating: String
    
    private enum CodingKeys: String, CodingKey {
        case imdbId = "imdbID"
        case title = "Title"
        case year = "Year"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case awards = "Awards"
        case poster = "Poster"
        case metaScore = "Metascore"
        case imdbRating = "imdbRating"
    }

}
