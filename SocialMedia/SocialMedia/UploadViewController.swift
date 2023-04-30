//
//  UploadViewController.swift
//  SocialMedia
//
//  Created by Yusuf Ziya YILDIRIM on 17.04.2023.
//

import UIKit
import Firebase
import FirebaseStorage

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.isUserInteractionEnabled = true
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(imageGestureRecognizer)
    
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
        self.dismiss(animated: true)
    }

    @IBAction func savePostClicked(_ sender: Any) {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5){
            let imageReference = storageRef.child("PostImages/\(UUID().uuidString).jpg")
            
            imageReference.putData(data) { (storageMetaData, error) in
                if error != nil {
                    self.errorMessage(titleInput: "Hata", messageInput: error!.localizedDescription)
                } else {
                    imageReference.downloadURL { url, error in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            
                            if let imageUrl = imageUrl {
                                let postData = ["email": Auth.auth().currentUser!.email!, "desc": self.descTextField.text!, "img": imageUrl, "tarih": FieldValue.serverTimestamp()] as [String : Any]
                                
                                let db = Firestore.firestore()
                                
                                db.collection("posts").addDocument(data: postData) {
                                    (error) in
                                    if error != nil {
                                        self.errorMessage(titleInput: "Hata", messageInput: error!.localizedDescription)
                                    } else {
                                        self.imageView.image = UIImage(named: "add")
                                        self.descTextField.text = ""
                                        self.tabBarController?.selectedIndex = 0
                                    }
                                }
                            }
                        }
                    }
                }
                
            }
        }
    }
    
    func errorMessage(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
