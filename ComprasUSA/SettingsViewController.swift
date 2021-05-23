//
//  SettingsViewController.swift
//  ComprasUSA
//
//  Created by Diogenes de Souza on 20/05/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var tfIOF: UITextField!
    @IBOutlet weak var tfEstateTaxes: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}
