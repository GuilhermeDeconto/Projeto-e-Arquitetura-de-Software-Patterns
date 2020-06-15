//
//  PaymentContext.swift
//  ProjetoeArquitetura
//
//  Created by Guilherme Deconto on 15/06/20.
//  Copyright © 2020 Guilherme Deconto. All rights reserved.
//

import Foundation

class PaymentContext {
    
    var paymentMethod: Payment?
    
    init(payment: Payment) {
        self.paymentMethod = payment
    }
    
    func payment() -> String{
        guard let payment = self.paymentMethod else {
            return "error"
        }
        return payment.pay()
    }
}
