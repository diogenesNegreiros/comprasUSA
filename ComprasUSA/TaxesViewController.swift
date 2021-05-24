//
//  TaxesViewController.swift
//  ComprasUSA
//
//  Created by Diogenes de Souza on 20/05/21.
//

import UIKit

class TaxesViewController: UIViewController {
    
    @IBOutlet weak var lbDolar: UILabel!
    @IBOutlet weak var lbStateTax: UILabel!
    @IBOutlet weak var labelIOfDescription: UILabel!
    @IBOutlet weak var labelIOF: UILabel!
    @IBOutlet weak var switchCreditCard: UISwitch!
    @IBOutlet weak var lbTotalReal: UILabel!
    @IBOutlet weak var labelStateTaxDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTaxes()
    }
    
    @IBAction func changeIOF(_ sender: UISwitch) {
        calculateTaxes()
    }
    
    func calculateTaxes() {
        labelStateTaxDescription.text = "Imposto do Estado \(tc.getFormattedValue(of: tc.stateTaxes, withCurrency: "")) )"
        labelIOfDescription.text = "IOF \(tc.getFormattedValue(of: tc.iof, withCurrency: "")) )"
        lbDolar.text = tc.getFormattedValue(of: tc.shoppingValue, withCurrency: "US$ ")
        lbStateTax.text = tc.getFormattedValue(of: tc.stateTaxesValue, withCurrency: "US$ ")
        labelIOF.text = tc.getFormattedValue(of: tc.iofValue, withCurrency: "US$ ")
        let real = tc.calculate(usindCreditCard: switchCreditCard.isOn)
        lbTotalReal.text = tc.getFormattedValue(of: real, withCurrency: "R$ ")
    }
    
}
