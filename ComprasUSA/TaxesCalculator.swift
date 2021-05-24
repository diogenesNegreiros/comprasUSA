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
    var dolar = 3.5
    var stateTaxes = 7.0
    var shoppingValue: Double = 0
    var iof = 6.38

    var shoppingValueInReal: Double {
        return shoppingValue * dolar
    }
    
    var stateTaxesValue: Double {
        return shoppingValue * stateTaxes/100
    }
    
    var iofValue: Double {
        return (shoppingValue + stateTaxes) * iof/100
    }
    
    private init() {
        formatter.alwaysShowsDecimalSeparator = true
    }
    
    func convertToDouble(_ string: String) -> Double {
        formatter.numberStyle = .none
        return formatter.number(from: string)!.doubleValue
    }
    
    func getFormattedValue(of value: Double, withCurrency currency: String) -> String {
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        formatter.alwaysShowsDecimalSeparator = true
        return formatter.string(for: value)!
    }
    
    func calculate(usindCreditCard: Bool) -> Double{
        var finalValue = shoppingValue + stateTaxesValue
        if usindCreditCard {
            finalValue += iofValue
        }
        return finalValue * dolar
    }
    
}
