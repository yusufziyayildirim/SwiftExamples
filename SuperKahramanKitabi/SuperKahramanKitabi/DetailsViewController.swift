//
//  DetailsViewController.swift
//  SuperKahramanKitabi
//
//  Created by Yusuf Ziya YILDIRIM on 15.04.2023.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    var secilenKahraman = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = secilenKahraman
    }
    
}
