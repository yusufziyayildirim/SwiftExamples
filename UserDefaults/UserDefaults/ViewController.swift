//
//  ViewController.swift
//  UserDefaults
//
//  Created by Yusuf Ziya YILDIRIM on 14.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var notLabel: UILabel!
    @IBOutlet weak var zamanLabel: UILabel!
    @IBOutlet weak var zamanTextField: UITextField!
    @IBOutlet weak var notTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let kaydedilenNot = UserDefaults.standard.object(forKey: "not")
        let kaydedilenZaman = UserDefaults.standard.object(forKey: "zaman")
        
        if let savedItem = kaydedilenNot as? String{
            notLabel.text = "Yapılacak İş : \(savedItem)"
        }
        
        if let savedItem = kaydedilenZaman as? String{
            zamanLabel.text = "Yapılacak Zaman : \(savedItem)"
        }
    }

    @IBAction func saveClicked(_ sender: Any) {
        UserDefaults.standard.set(notTextField.text, forKey: "not")
        UserDefaults.standard.set(zamanTextField.text, forKey: "zaman")

        notLabel.text = "Yapılacak İş : \(notTextField.text!)"
        zamanLabel.text = "Yapılacak Zaman: \(zamanTextField.text!)"
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        let kaydedilenNot = UserDefaults.standard.object(forKey: "not")
        let kaydedilenZaman = UserDefaults.standard.object(forKey: "zaman")
        
        if (kaydedilenNot as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "not")
            notLabel.text="Yapılacak İş :"
        }
        
        if (kaydedilenZaman as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "zaman")
            zamanLabel.text="Yapılacak Zaman:"
        }
    }
}

