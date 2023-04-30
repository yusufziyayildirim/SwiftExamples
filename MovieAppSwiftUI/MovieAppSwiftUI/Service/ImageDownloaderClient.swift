//
//  ImageDownloaderClient.swift
//  MovieAppSwiftUI
//
//  Created by Yusuf Ziya YILDIRIM on 30.04.2023.
//

import Foundation

class ImageDownloaderClient : ObservableObject {
    
    @Published var image : Data?
    
    func getImages(url: String) {
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            
            DispatchQueue.main.async {
                self.image = data
            }
            
        }.resume()
    }
}
