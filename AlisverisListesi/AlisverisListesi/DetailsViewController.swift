//
//  DetailsViewController.swift
//  AlisverisListesi
//
//  Created by Yusuf Ziya YILDIRIM on 15.04.2023.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var isimTextField: UITextField!
    @IBOutlet weak var fiyatTextField: UITextField!
    @IBOutlet weak var bedenTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var secilenUrunIsmi = ""
    var secilenUrunUUID : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if secilenUrunIsmi != "" {
            saveButton.isHidden = true
            isimTextField.isEnabled = false
            fiyatTextField.isEnabled = false
            bedenTextField.isEnabled = false
            
            //Core Data seçilen ürün bilgilerini göster
            if let uuidString = secilenUrunUUID?.uuidString {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Alisveris")
                fetchReq.predicate = NSPredicate(format: "id = %@", uuidString)
                fetchReq.returnsObjectsAsFaults = false
                
                do{
                    let sonuclar = try context.fetch(fetchReq)
                    if sonuclar.count > 0 {
                        for sonuc in sonuclar as! [NSManagedObject]{
                            if let isim = sonuc.value(forKey: "isim") as? String{
                                isimTextField.text = isim
                            }
                            
                            if let fiyat = sonuc.value(forKey: "fiyat") as? Int{
                                fiyatTextField.text = String(fiyat)
                            }
                            
                            if let beden = sonuc.value(forKey: "beden") as? String{
                                bedenTextField.text = beden
                            }
                            
                            if let gorselData = sonuc.value(forKey: "gorsel") as? Data{
                                let image = UIImage(data: gorselData)
                                imageView.image = image
                            }
                        }  
                    }
                } catch {
                    printContent("Hata")
                }
            }
        } else {
            saveButton.isHidden = false
            saveButton.isEnabled = false
            isimTextField.isEnabled = true
            fiyatTextField.isEnabled = true
            bedenTextField.isEnabled = true
            isimTextField.text = ""
            fiyatTextField.text = ""
            bedenTextField.text = ""
            
            imageView.isUserInteractionEnabled = true
            let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
            imageView.addGestureRecognizer(imageGestureRecognizer)
        }

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
    @objc func chooseImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.editedImage] as? UIImage
        saveButton.isEnabled = true
        self.dismiss(animated: true)
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let alisveris = NSEntityDescription.insertNewObject(forEntityName: "Alisveris", into: context)
        
        alisveris.setValue(UUID(), forKey: "id")
        alisveris.setValue(isimTextField.text, forKey: "isim")
        alisveris.setValue(bedenTextField.text, forKey: "beden")
        
        if let fiyat = Int(fiyatTextField.text!){
            alisveris.setValue(fiyat, forKey: "fiyat")
        }
        
        let imageData = imageView.image!.jpegData(compressionQuality: 0.5)
        alisveris.setValue(imageData, forKey: "gorsel")
        
        do{
            try context.save()
            print("Kayıt edildi")
        } catch {
            print("Hata")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "veriGirildi"), object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    

}
