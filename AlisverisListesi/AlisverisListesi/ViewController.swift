//
//  ViewController.swift
//  AlisverisListesi
//
//  Created by Yusuf Ziya YILDIRIM on 15.04.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate
, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var isimDizisi = [String]()
    var idDizisi = [UUID]()
    
    var secilenIsim = ""
    var secilenUUID : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClicked))
        
        getDatas()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getDatas), name: NSNotification.Name(rawValue: "veriGirildi"), object: nil)
    }

    @objc func getDatas(){
        isimDizisi.removeAll(keepingCapacity: false)
        idDizisi.removeAll(keepingCapacity: false)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Alisveris")
        fetchReq.returnsObjectsAsFaults = false
        
        do{
            let sonuclar = try context.fetch(fetchReq)
            if sonuclar.count > 0 {
                for sonuc in sonuclar as! [NSManagedObject]{
                    if let isim = sonuc.value(forKey: "isim") as? String{
                        isimDizisi.append(isim)
                    }
                    
                    if let id = sonuc.value(forKey: "id") as? UUID{
                        idDizisi.append(id)
                    }
                }
                
                tableView.reloadData()
            }
        } catch {
            printContent("Hata")
        }
        
    }
    
    @objc func addButtonClicked() {
        secilenIsim = ""
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isimDizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = isimDizisi[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.secilenUrunIsmi = secilenIsim
            destinationVC.secilenUrunUUID = secilenUUID
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secilenIsim = isimDizisi[indexPath.row]
        secilenUUID = idDizisi[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Alisveris")
            fetchReq.predicate = NSPredicate(format: "id = %@", idDizisi[indexPath.row].uuidString)
            fetchReq.returnsObjectsAsFaults = false
            
            do{
                let sonuclar = try context.fetch(fetchReq)
                if sonuclar.count > 0 {
                    for sonuc in sonuclar as! [NSManagedObject]{
                        if let id = sonuc.value(forKey: "id") as? UUID {
                            if id == idDizisi[indexPath.row] {
                                context.delete(sonuc)
                                isimDizisi.remove(at: indexPath.row)
                                idDizisi.remove(at: indexPath.row)
                                self.tableView.reloadData()
                                
                                do{
                                    try context.save()
                                } catch {
                                    print("hata")
                                }
                                
                                break
                            }
                        }
                    }
                }
            } catch {
                printContent("Hata")
            }
        }
    }
}

