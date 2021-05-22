//
//  ViewController.swift
//  ComprasUSA
//
//  Created by Diogenes de Souza on 20/05/21.
//

import UIKit

class ShoppingViewController: UIViewController {
    @IBOutlet weak var tfGastosUsa: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

