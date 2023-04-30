//
//  DownloaderClient.swift
//  MovieAppSwiftUI
//
//  Created by Yusuf Ziya YILDIRIM on 30.04.2023.
//

import Foundation


class DownloaderClient {
    
    func getMovies(search: String, completion: @escaping (Result<[Movie]?, DownloaderError>) -> Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=8ad629e0") else {
            return completion(.failure(.yanlisUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let moviesData = try? JSONDecoder().decode(MoviesData.self, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            
            completion(.success(moviesData.movies))
            
        }.resume()
    }
    
    func getMovieDetail(imdbId: String, completion: @escaping (Result<MovieDetail, DownloaderError>) -> Void ){
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=8ad629e0") else {
            return completion(.failure(.yanlisUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let movieDetail = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            
            completion(.success(movieDetail))
            
        }.resume()
    }
    
}


enum DownloaderError: Error {
    case yanlisUrl
    case veriGelmedi
    case veriIslenemedi
}
