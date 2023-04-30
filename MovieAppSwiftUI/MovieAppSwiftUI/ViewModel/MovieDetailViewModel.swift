//
//  MovieDetailViewModel.swift
//  MovieAppSwiftUI
//
//  Created by Yusuf Ziya YILDIRIM on 30.04.2023.
//

import Foundation
import SwiftUI

class MovieDetailViewModel : ObservableObject {
    @Published var movieDetail: MovieDetailsViewModel?
    let dowloaderClient = DownloaderClient()
    
    func getMovieDetail(imdbId: String){
        dowloaderClient.getMovieDetail(imdbId: imdbId) { (result) in
            switch result {
                case .success(let movieDetail):
                    DispatchQueue.main.async {
                        self.movieDetail = MovieDetailsViewModel(detail: movieDetail)
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}


struct MovieDetailsViewModel {
    let detail : MovieDetail
    
    var title : String {
        detail.title
    }
    var poster : String {
        detail.poster
    }
    var year: String {
        detail.year
    }
    var imdbId: String {
        detail.imdbId
    }
    var director: String {
        detail.director
    }
    var writer: String {
        detail.writer
    }
    var awards: String {
        detail.awards
    }
    var plot: String {
        detail.plot
    }
    
}
