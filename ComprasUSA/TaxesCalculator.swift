//
//  TaxesCalculator.swift
//  ComprasUSA
//
//  Created by Diogenes de Souza on 23/05/21.
//

import Foundation

extension Locale {
    static let br = Locale(identifier: "pt_BR")
    static let us = Locale(identifier: "en_US")
    static let uk = Locale(identifier: "en_GB") // ISO Locale
}

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
        let string = string.replacingOccurrences(of: ",", with: "")
        formatter.numberStyle = .none
        formatter.locale = Locale.us
        let num = formatter.number(from: string)!.doubleValue
        return num
    }
    
    func updateAmount(amount: Int) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.us
        formatter.currencySymbol = ""
        let amount = Double(amount/100) + Double(amount%100)/100
        return formatter.string(from: NSNumber(value: amount))
    }
    
    func getFormattedValue(of value: Double, withCurrency currency: String, withLocale locale: Locale = Locale.us) -> String {
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        formatter.locale = locale
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
