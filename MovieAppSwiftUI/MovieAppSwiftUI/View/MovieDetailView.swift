//
//  MovieDetailView.swift
//  MovieAppSwiftUI
//
//  Created by Yusuf Ziya YILDIRIM on 30.04.2023.
//

import SwiftUI

struct MovieDetailView: View {
    var imdbId: String
    @ObservedObject var movieDetailViewModel = MovieDetailViewModel()
    
    var body: some View { 
        VStack(alignment: .leading){
            MovieImageView(url: movieDetailViewModel.movieDetail?.poster ?? "")
                .frame(height: 300)
                .padding()
            
            Text(movieDetailViewModel.movieDetail?.title ?? "")
                .font(.title).padding()
            
            Text(movieDetailViewModel.movieDetail?.plot ?? "")
                .padding()
            
            Text("Yıl: \(movieDetailViewModel.movieDetail?.year ?? "")").padding()
            
            Text("Yönetmen: \(movieDetailViewModel.movieDetail?.director ?? "")").padding()
            
            Text("Yazar: \(movieDetailViewModel.movieDetail?.writer ?? "")").padding()
            
            Text("Ödüller: \(movieDetailViewModel.movieDetail?.awards ?? "")").padding()
            
            
        }.onAppear {
            self.movieDetailViewModel
                .getMovieDetail(imdbId: imdbId)
            
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(imdbId: "tt0120737")
    }
}
