//
//  PaymentFactory.swift
//  ProjetoeArquitetura
//
//  Created by Guilherme Deconto on 15/06/20.
//  Copyright © 2020 Guilherme Deconto. All rights reserved.
//

import Foundation
class PaymentFactory {
    func getPayment(payment: String) -> PaymentMethod? {
            switch payment {
            case "Paypal":
                return PaypalMethod()
            case "Master":
                return MasterMethod()
            case "Debit":
                return DebitMethod()
            default:
                return nil
            }
        }
    }
