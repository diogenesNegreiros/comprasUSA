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
        tfDolar.text = tc.getFormattedValue(of: tc.dolar, withCurrency: "")
        tfIOF.text = tc.getFormattedValue(of: tc.iof, withCurrency: "")
        tfEstateTaxes.text = tc.getFormattedValue(of: tc.stateTaxes, withCurrency: "")
        
        tfDolar.delegate = self
        tfIOF.delegate = self
        tfEstateTaxes.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func setValues() {
        tc.dolar = tc.convertToDouble(tfDolar.text!) ?? 3.5
        tc.iof = tc.convertToDouble(tfIOF.text!) ?? 6.38
        tc.stateTaxes = tc.convertToDouble(tfEstateTaxes.text!) ?? 7.0
    }

}

extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        setValues()
    }
    
}
