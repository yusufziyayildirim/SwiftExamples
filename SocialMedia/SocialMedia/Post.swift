//
//  Post.swift
//  SocialMedia
//
//  Created by Yusuf Ziya YILDIRIM on 18.04.2023.
//

import Foundation

class Post {
    var email : String
    var img : String
    var desc : String
    
    init(email: String, img: String, desc: String) {
        self.email = email
        self.img = img
        self.desc = desc
    }
}
