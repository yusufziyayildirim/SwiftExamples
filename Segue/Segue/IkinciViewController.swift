//
//  IkinciViewController.swift
//  Segue
//
//  Created by Yusuf Ziya YILDIRIM on 14.04.2023.
//

import UIKit

class IkinciViewController: UIViewController {

    @IBOutlet weak var secondaLabel: UILabel!
    
    @IBOutlet weak var alinanDegerText: UILabel!
    var girilenDeger = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        alinanDegerText.text = girilenDeger
    }
    
}
