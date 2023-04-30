//
//  ViewController.swift
//  UyariMesajlari
//
//  Created by Yusuf Ziya YILDIRIM on 15.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfrimTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpClicked(_ sender: Any) {
        if emailTextField.text == "" {
            alertOlustur(title: "Hata Mesajı", message: "Email giriniz")
        } else if passwordTextField.text == ""{
            alertOlustur(title: "Hata Mesajı", message: "Parolanızı giriniz")
        } else if passwordTextField.text != passwordConfrimTextField.text{
            alertOlustur(title: "Hata Mesajı", message: "Parolalar eşleşmiyor")
        } else{
            alertOlustur(title: "İşlem başarılı", message: "Kullanıcı kaydedildi")
        }
    }
    
    func alertOlustur(title : String, message: String){
        let uyariMesaji = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
            print("Ok butonuna tıklandı")
        }
        
        uyariMesaji.addAction(okButton)
        
        self.present(uyariMesaji, animated: true, completion: nil)
        
    }
    
}

