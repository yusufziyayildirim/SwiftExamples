//
//  DetailsViewController.swift
//  SehirApp
//
//  Created by Yusuf Ziya YILDIRIM on 15.04.2023.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var sehirLabel: UILabel!
    @IBOutlet weak var bolgeLabel: UILabel!
    
    var secilenSehir : Sehir?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sehirLabel.text = secilenSehir?.isim
        bolgeLabel.text = secilenSehir?.bolge
    }
    
}
