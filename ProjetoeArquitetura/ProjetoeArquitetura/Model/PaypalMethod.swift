//
//  PaypalMethod.swift
//  ProjetoeArquitetura
//
//  Created by Guilherme Deconto on 15/06/20.
//  Copyright © 2020 Guilherme Deconto. All rights reserved.
//

import Foundation
class PaypalMethod: PaymentMethod {
    override init() {
        super.init()
        self.name = "Paypal"
        self.type = "Online Purchase"
        self.message = "default"
    }
}
