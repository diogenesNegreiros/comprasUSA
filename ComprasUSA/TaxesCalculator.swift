//
//  TaxesCalculator.swift
//  ComprasUSA
//
//  Created by Diogenes de Souza on 23/05/21.
//

import Foundation

class TaxesCalculator {
    
    static let shared = TaxesCalculator()
    let formatter = NumberFormatter()
    let dolar = 3.5
    var stateTaxes = 7.0
    var shoppingValue: Double = 0
    var iof = 6.38
    
    var shoppingValueInReal: Double {
        return shoppingValue * dolar
    }
    
    var stateTaxesValues: Double {
        return shoppingValue * stateTaxes/100
    }
    
    var iofValue: Double {
        return (shoppingValue + stateTaxes) * iof/100
    }
    
    private init() {
        formatter.alwaysShowsDecimalSeparator = true
    }
    
    func calculate(usindCreditCard: Bool) -> Double{
        var finalValue = shoppingValue + stateTaxes
        if usindCreditCard {
            finalValue += iofValue
        }
        return finalValue
    }
}
