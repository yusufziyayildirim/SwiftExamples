//
//  FeedTableViewCell.swift
//  SocialMedia
//
//  Created by Yusuf Ziya YILDIRIM on 18.04.2023.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameTextField: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var descTextField: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userImageView.contentMode = .scaleAspectFill
        userImageView.clipsToBounds = true
        userImageView.layer.cornerRadius = userImageView.frame.size.width / 2
        userImageView.layer.borderWidth = 0.3
        userImageView.layer.borderColor = UIColor.black.cgColor
        userImageView.layer.masksToBounds = true
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
