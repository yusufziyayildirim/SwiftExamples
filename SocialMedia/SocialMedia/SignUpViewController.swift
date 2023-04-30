//
//  SignUpViewController.swift
//  SocialMedia
//
//  Created by Yusuf Ziya YILDIRIM on 17.04.2023.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfrimTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty,
              let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let passwordConfirm = passwordConfrimTextField.text, !passwordConfirm.isEmpty else {
                errorMessage(titleInput: "Hata!", messageInput: "Tüm alanların doldurulması zorunludur..")
                return
            }
        if password != passwordConfirm {
            errorMessage(titleInput: "Hata!", messageInput: "Parolalar eşleşmiyor")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){
            (authDataResult, error) in
            if error != nil {
                self.errorMessage(titleInput: "Hata", messageInput: error!.localizedDescription)
            } else {
                let userData = ["email": email, "name": name, "img": nil]
                
                let db = Firestore.firestore()
                db.collection("users").document((authDataResult?.user.uid)!).setData(userData as [String : Any]) { error in
                            guard error == nil else {
                                return
                            }
                        }
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func errorMessage(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
