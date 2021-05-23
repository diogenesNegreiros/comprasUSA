//
//  UIViewController+TaxesCalculator.swift
//  ComprasUSA
//
//  Created by Diogenes de Souza on 23/05/21.
//

import Foundation
import UIKit

extension UIViewController {
    var tc: TaxesCalculator {
        return TaxesCalculator.shared
    }
}
