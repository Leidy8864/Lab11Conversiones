//
//  ViewController.swift
//  Lab11
//
//  Created by Leidy Callupe on 7/05/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource   {

    @IBOutlet weak var tableView: UITableView!
    var conversiones:[Conversion] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func agregar(_ sender: Any) {
        performSegue(withIdentifier: "agregarConversion", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversiones.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let conversion = conversiones[indexPath.row]
        var numconv = 0.0
        if conversion.medida1 == "kilometros" &&  conversion.medida2 == "millas"{
            numconv = Double(conversion.numero / 1.609)
        }
        
        if conversion.medida1 == "millas" &&  conversion.medida2 == "kilometros"{
            numconv = Double(conversion.numero * 1.60934)
        }
        
        if conversion.medida1 == "kilometros" &&  conversion.medida2 == "yardas"{
            numconv = Double(conversion.numero * 1093.61)
        }
        
        if conversion.medida1 == "yardas" &&  conversion.medida2 == "kilometros"{
            numconv = Double(conversion.numero / 1093.61)
        }
        
        if conversion.medida1 == "millas" &&  conversion.medida2 == "yardas"{
            numconv = Double(conversion.numero * 1760)
        }
        
        if conversion.medida1 == "yardas" &&  conversion.medida2 == "millas"{
            numconv = Double(conversion.numero / 1760)
        }
        cell.textLabel?.text = "\(conversion.numero) \(String(describing: conversion.medida1!)) = \(numconv) \(String(describing: conversion.medida2!))"
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func obtenerConversiones(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            conversiones = try context.fetch(Conversion.fetchRequest()) as! [Conversion]
        }catch{
            print("Error")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerConversiones()
        tableView.reloadData()
    }
    
}

