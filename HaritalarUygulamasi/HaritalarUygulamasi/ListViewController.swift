//
//  ListViewController.swift
//  HaritalarUygulamasi
//
//  Created by Yusuf Ziya YILDIRIM on 16.04.2023.
//

import UIKit
import CoreData

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var isimDizisi = [String]()
    var idDizisi = [UUID]()
    
    var secilenYerIsim = ""
    var secilenYerId: UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClicked))
        
        getDatas()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getDatas), name: NSNotification.Name("yeniYerOlusturuldu"), object: nil)
    }
    
    @objc func getDatas() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Yer")
        request.returnsObjectsAsFaults = false
        
        do {
            let sonuclar = try context.fetch(request)
            
            if sonuclar.count > 0 {
                isimDizisi.removeAll(keepingCapacity: false)
                idDizisi.removeAll(keepingCapacity: false)
                
                for sonuc in sonuclar as! [NSManagedObject]{
                    if let isim = sonuc.value(forKey: "isim") as? String{
                        isimDizisi.append(isim)
                    }
                    
                    if let id = sonuc.value(forKey: "id") as? UUID{
                        idDizisi.append(id)
                    }
                }
            }
            tableView.reloadData()
            
        } catch {
            print("hata")
        }
    }
 
    @objc func addButtonClicked() {
        secilenYerIsim = ""
        performSegue(withIdentifier: "toMapsVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isimDizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = isimDizisi[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secilenYerId = idDizisi[indexPath.row]
        secilenYerIsim = isimDizisi[indexPath.row]
        performSegue(withIdentifier: "toMapsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMapsVC" {
            let destinationVC = segue.destination as! MapsViewController
            destinationVC.secilenId = secilenYerId
            destinationVC.secilenIsim = secilenYerIsim
        }
    }
    
}
