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
    
    var amount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfDolar.text = tc.getFormattedValue(of: tc.dolar, withCurrency: "", withLocale: Locale.us)
        tfIOF.text = tc.getFormattedValue(of: tc.iof, withCurrency: "", withLocale: Locale.us)
        tfEstateTaxes.text = tc.getFormattedValue(of: tc.stateTaxes, withCurrency: "", withLocale: Locale.us)
        
        tfDolar.delegate = self
        tfIOF.delegate = self
        tfEstateTaxes.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func setValues() {
        
        if let dolarText = tfDolar.text {
            tc.dolar = tc.convertToDouble(dolarText)
        }
        
        if let iofText = tfIOF.text {
            tc.iof = tc.convertToDouble(iofText)
        }
        
        if let stateTaxesText = tfEstateTaxes.text {
            tc.stateTaxes = tc.convertToDouble(stateTaxesText)
        }
    }
}

extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        amount = 0
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        setValues()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let digit = Int (string) {
            
            if amount <= 999 {
                amount = amount * 10 + digit
                textField.text = tc.updateAmount(amount: amount)
            }
        }
        
        if string == "" {
            amount = amount/10
            textField.text = tc.updateAmount(amount: amount)
        }
        
        return false
    }
    
}
