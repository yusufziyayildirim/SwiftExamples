//
//  MovieViewModel.swift
//  MovieAppSwiftUI
//
//  Created by Yusuf Ziya YILDIRIM on 30.04.2023.
//

import Foundation
import SwiftUI

class MovieListViewModel : ObservableObject {
    @Published var movies = [MovieViewModel]()
    let dowloaderClient = DownloaderClient()
    
    func searchMovies(search: String){
        dowloaderClient.getMovies(search: search) { (result) in
            switch result {
                case .success(let moviesArray):
                if let moviesArray = moviesArray {
                    DispatchQueue.main.async {
                        self.movies = moviesArray.map(MovieViewModel.init)
                    }
                }
                case .failure(let error):
                    print(error)
            }
        }
    }
}


struct MovieViewModel {
    let movie : Movie
    
    var title : String {
        movie.title
    }
    var poster : String {
        movie.poster
    }
    var year: String {
        movie.year
    }
    var imdbId: String {
        movie.imdbId
    }
}
