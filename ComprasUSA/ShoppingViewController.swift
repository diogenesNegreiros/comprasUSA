//
//  ViewController.swift
//  ComprasUSA
//
//  Created by Diogenes de Souza on 20/05/21.
//

import UIKit

class ShoppingViewController: UIViewController{
    
    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var lbRealDescription: UILabel!
    @IBOutlet weak var lbReal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAmmount()
    }
    
    func setAmmount() {
        if tfDolar.text == "" {
            tc.shoppingValue = 0
        }else{
            tc.shoppingValue = tc.convertToDouble(tfDolar.text!)
        }
        lbReal.text = tc.getFormattedValue(of: tc.shoppingValue * tc.dolar, withCurrency: "R$ ")
        let dolar = tc.getFormattedValue(of: tc.dolar, withCurrency: "")
        lbRealDescription.text = "Valor sem impostos (dolár \(dolar))"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tfDolar.resignFirstResponder()
        setAmmount()
        tfDolar.text = tc.getFormattedValue(of: tc.shoppingValue , withCurrency: "")
    }
    
}


