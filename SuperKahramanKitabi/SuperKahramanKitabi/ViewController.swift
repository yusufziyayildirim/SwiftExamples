//
//  ViewController.swift
//  SuperKahramanKitabi
//
//  Created by Yusuf Ziya YILDIRIM on 15.04.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var superKahramanIsimleri = [String]()
    var secilenIsim = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        superKahramanIsimleri.append("Batman")
        superKahramanIsimleri.append("Superman")
        superKahramanIsimleri.append("Iron Man")
        superKahramanIsimleri.append("Spiderman")
        superKahramanIsimleri.append("Captain America")
    }
    
    //Kaç adet row olacak
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superKahramanIsimleri.count
    }
    
    //Hücre içerisinde neler gösterilecek
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superKahramanIsimleri[indexPath.row]
        return cell
    }

    //İOS sola doğru item silme işlemi
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            superKahramanIsimleri.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }

    //İtema tıklandığına ne olacağı
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secilenIsim = superKahramanIsimleri[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    //Segue kontrol
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.secilenKahraman = secilenIsim
        }
    }
}

