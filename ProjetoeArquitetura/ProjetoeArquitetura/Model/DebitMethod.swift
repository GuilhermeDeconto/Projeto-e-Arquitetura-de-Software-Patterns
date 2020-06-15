//
//  DebitMethod.swift
//  ProjetoeArquitetura
//
//  Created by Guilherme Deconto on 15/06/20.
//  Copyright © 2020 Guilherme Deconto. All rights reserved.
//

import Foundation
class DebitMethod: PaymentMethod {
    override init() {
        super.init()
        self.name = "Debit"
        self.type = "Online Purchase"
        self.message = "default"
    }
}
