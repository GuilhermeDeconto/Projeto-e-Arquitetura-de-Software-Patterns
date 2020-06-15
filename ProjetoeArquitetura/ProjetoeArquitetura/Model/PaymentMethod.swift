//
//  PaymentMethod.swift
//  ProjetoeArquitetura
//
//  Created by Guilherme Deconto on 15/06/20.
//  Copyright © 2020 Guilherme Deconto. All rights reserved.
//

import Foundation
class PaymentMethod {
    private var _name = String()
    var name: String {
        get {
            return _name
        }
        
        set {
            _name = newValue
        }
    }
    private var _type = String()
    var type: String {
        get {
            return _type
        }
        
        set {
            _type = newValue
        }
    }
    
    private var _message = String()
    var message: String {
        get {
            return _message
        }
        
        set {
            _message = newValue
        }
    }
}
