//
//  SettingsViewController.swift
//  SocialMedia
//
//  Created by Yusuf Ziya YILDIRIM on 17.04.2023.
//

import UIKit
import Firebase
class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toSignIn", sender: nil)
        } catch {
            print("Hata")
        }
    }
    
}
