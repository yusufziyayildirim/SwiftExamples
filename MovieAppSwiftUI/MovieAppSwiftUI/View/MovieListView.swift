//
//  MovieListView.swift
//  MovieAppSwiftUI
//
//  Created by Yusuf Ziya YILDIRIM on 30.04.2023.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var movieListViewModel: MovieListViewModel
    
    @State var searchMovie = ""
    init() {
        self.movieListViewModel = MovieListViewModel()
        
    }
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Film ara", text: $searchMovie) {
                    movieListViewModel.searchMovies(search: searchMovie.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchMovie)
                }.padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                List(movieListViewModel.movies, id:\.imdbId){
                    movie in
                    NavigationLink {
                        MovieDetailView(imdbId: movie.imdbId)
                    } label: {
                        HStack{
                            MovieImageView(url: movie.poster)
                                .frame(width: 100, height: 100)
                            
                            VStack(alignment: .leading) {
                                Text(movie.title)
                                    .font(.title3)
                                    .bold()
                                
                                Text(movie.year)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }.navigationTitle(Text("Movies"))
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
