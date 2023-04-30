//
//  ViewController.swift
//  Segue
//
//  Created by Yusuf Ziya YILDIRIM on 14.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var girilenText: UITextField!
    
    var alinanDeger = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func kontrolEtClicked(_ sender: Any) {
        alinanDeger = girilenText.text!
        if alinanDeger == "sifre" {
            performSegue(withIdentifier: "toIkinciVC", sender: nil)
        }else{
            firstLabel.text = "Şifreniz yanlış"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toIkinciVC" {
            let destinationVC = segue.destination as! IkinciViewController
            destinationVC.girilenDeger = alinanDeger
        }
    }
    
}

