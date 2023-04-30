//
//  FeedViewController.swift
//  SocialMedia
//
//  Created by Yusuf Ziya YILDIRIM on 17.04.2023.
//

import UIKit
import Firebase
import SDWebImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var postArray = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getPostDatasFromFirebase()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for:  indexPath) as! FeedTableViewCell
        cell.userImageView.image = UIImage(named: "add")
        cell.postImageView.sd_setImage(with: URL(string: self.postArray[indexPath.row].img))
        cell.userNameTextField.text = postArray[indexPath.row].email
        cell.descTextField.text = "\(postArray[indexPath.row].email): \(postArray[indexPath.row].desc)"
        return cell
    }
    
    func getPostDatasFromFirebase (){
        let db = Firestore.firestore()
        
        db.collection("posts").order(by: "tarih", descending: true)
            .addSnapshotListener({ snapshotData, error in
                if error != nil {
                    //hata
                } else {
                    if snapshotData?.isEmpty != true && snapshotData != nil{
                        
                        self.postArray.removeAll(keepingCapacity: false)
                        
                        for document in snapshotData!.documents {
                            if let imgUrl = document.get("img") as? String {
                                if let email = document.get("email") as? String {
                                    if let desc = document.get("desc") as? String {
                                        let post = Post(email: email, img: imgUrl, desc: desc)
                                        self.postArray.append(post)
                                    }
                                }
                            }
                           
                            
                        }
                        
                        self.tableView.reloadData()
                    }
                }
        })
            
    }
}
