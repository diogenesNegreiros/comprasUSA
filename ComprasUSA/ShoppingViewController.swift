//
//  ViewController.swift
//  ComprasUSA
//
//  Created by Diogenes de Souza on 20/05/21.
//

import UIKit

class ShoppingViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var lbRealDescription: UILabel!
    @IBOutlet weak var lbReal: UILabel!
    
    var amount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfDolar.delegate = self
        tfDolar.placeholder = tc.updateAmount(amount: amount)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAmount()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let digit = Int (string) {
            amount = amount * 10 + digit
            tfDolar.text = tc.updateAmount(amount: amount)
        }
        
        if string == "" {
            amount = amount/10
            tfDolar.text = tc.updateAmount(amount: amount)
        }
        return false
    }
    
 
    
    func setAmount() {
        if tfDolar.text == "" {
            tc.shoppingValue = 0
        }else{
            tc.shoppingValue = tc.convertToDouble(tfDolar.text!)
        }
        lbReal.text = tc.getFormattedValue(of: tc.shoppingValue * tc.dolar, withCurrency: "R$ ", withLocale: Locale.br)
        let dolar = tc.getFormattedValue(of: tc.dolar, withCurrency: "", withLocale: Locale.us)
        lbRealDescription.text = "Valor sem impostos (dolár \(dolar))"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tfDolar.resignFirstResponder()
        setAmount()
        tfDolar.text = tc.getFormattedValue(of: tc.shoppingValue , withCurrency: "")
    }
    
}


