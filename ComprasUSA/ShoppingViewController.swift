//
//  ViewController.swift
//  ComprasUSA
//
//  Created by Diogenes de Souza on 20/05/21.
//

import UIKit

class ShoppingViewController: UIViewController {
    
    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var lbRealDescription: UILabel!
    @IBOutlet weak var lbReal: UILabel!
    

    
//    lazy var numberFormatter: NumberFormatter = {
//        let formatter = NumberFormatter()
//        formatter.locale = Locale(identifier: "pt_BR")
//        formatter.numberStyle = .currency
//        return formatter
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

