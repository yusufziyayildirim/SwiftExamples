//
//  ViewController.swift
//  SocialMedia
//
//  Created by Yusuf Ziya YILDIRIM on 17.04.2023.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
                errorMessage(titleInput: "Hata!", messageInput: "Tüm alanların doldurulması zorunludur..")
                return
            }
        
        Auth.auth().signIn(withEmail: email, password: password){
            (authDataResult, error) in
            if error != nil {
                self.errorMessage(titleInput: "Hata", messageInput: error!.localizedDescription)
            } else {
                self.performSegue(withIdentifier: "toFeedVC", sender: nil)
            }
        }
    }
    
    func errorMessage(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

