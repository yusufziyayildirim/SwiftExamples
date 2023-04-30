//
//  ViewController.swift
//  JestAlgilayicilar
//
//  Created by Yusuf Ziya YILDIRIM on 15.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var konumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gorselDegistir))
        
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func gorselDegistir(){
        if konumLabel.text == "İstanbul"{
            imageView.image = UIImage(named: "ankara")
            konumLabel.text = "Ankara"
        }else{
            imageView.image = UIImage(named: "istanbul")
            konumLabel.text = "İstanbul"
        }
        
    }


}

