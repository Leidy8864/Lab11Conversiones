//
//  ConversorViewController.swift
//  Lab11
//
//  Created by Leidy Callupe on 7/05/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import UIKit

class ConversorViewController: UIViewController{

    @IBOutlet weak var txtNum: UITextField!
    @IBOutlet weak var txtmedida1: UITextField!
    @IBOutlet weak var txtmedida2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Convertir(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let conversion = Conversion(context : context)
        conversion.numero = Float(txtNum.text!)!
        conversion.medida1 = txtmedida1.text!
        conversion.medida2 = txtmedida2.text!
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
