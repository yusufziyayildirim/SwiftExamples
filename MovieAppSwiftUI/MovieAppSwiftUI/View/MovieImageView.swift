//
//  MovieImageView.swift
//  MovieAppSwiftUI
//
//  Created by Yusuf Ziya YILDIRIM on 30.04.2023.
//

import SwiftUI

struct MovieImageView: View {
    
    let url : String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url: String) {
        self.url = url
        self.imageDownloaderClient.getImages(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageDownloaderClient.image {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }else {
            return Image("placeholder")
                .resizable()
        }
    }
}

struct MovieImageView_Previews: PreviewProvider {
    static var previews: some View {
        MovieImageView(url: "https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg")
    }
}
