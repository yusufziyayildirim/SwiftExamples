//
//  ViewController.swift
//  SehirApp
//
//  Created by Yusuf Ziya YILDIRIM on 15.04.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var sehirDizisi = [Sehir]()
    var kullaniciSecimi : Sehir?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        //Şehirler
        let istanbul = Sehir(isim: "istanbul", bolge: "Marmara")
        let ankara = Sehir(isim: "ankara", bolge: "İç Anadolu")
        let mus = Sehir(isim: "Muş", bolge: "Doğu Anadolu")
        let trabzon = Sehir(isim: "trabzon", bolge: "Karadeniz")
        let antalya = Sehir(isim: "antalya", bolge: "Akdeniz")
        
        sehirDizisi = [istanbul, ankara, mus, trabzon, antalya]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sehirDizisi.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = sehirDizisi[indexPath.row].isim
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        kullaniciSecimi = sehirDizisi[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.secilenSehir = kullaniciSecimi
        }
    }
}

