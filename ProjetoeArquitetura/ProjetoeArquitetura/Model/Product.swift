//
//  Product.swift
//  ProjetoeArquitetura
//
//  Created by Guilherme Deconto on 15/06/20.
//  Copyright © 2020 Guilherme Deconto. All rights reserved.
//

import Foundation

class Product: NSObject, NSCoding  {
    var name: String = ""
    var price: String = "0.0"
    var quantity: String = "0"
    
    init(name: String, price: String, quantity: String) {
        self.name = name
        self.price = price
        self.quantity = quantity
    }
    
    override init() {
    }
    
    enum CodingKeys: String  { //CodingKey
        case name
        case price
        case quantity
           var identifier: String {
            return self.rawValue.capitalized
           }
       }
    
    required init?(coder decoder: NSCoder) {
        typealias key = CodingKeys
        name = decoder.decodeObject(forKey: key.name.identifier) as? String ?? ""
        price = decoder.decodeObject(forKey: key.price.identifier) as? String ?? ""
        quantity = decoder.decodeObject(forKey: key.quantity.identifier) as? String ?? ""
    }
    
    func encode(with coder: NSCoder) {
        typealias key = CodingKeys
        coder.encode(self.name, forKey: key.name.identifier)
        coder.encode(self.price, forKey: key.price.identifier)
        coder.encode(self.quantity, forKey: key.quantity.identifier)
    }

}
