//
//  ProductList.swift
//  ProjetoeArquitetura
//
//  Created by Guilherme Deconto on 15/06/20.
//  Copyright © 2020 Guilherme Deconto. All rights reserved.
//

import Foundation
import ObjectMapper

class ProductList: NSObject, NSCoding {
    var products: [Product] = []
    
    enum CodingKeys: String  { //CodingKey
           case products
           var identifier: String {
            return self.rawValue.capitalized
           }
       }
    
    required init?(coder decoder: NSCoder) {
        typealias key = CodingKeys
        products = decoder.decodeObject(forKey: key.products.identifier) as? [Product] ?? []
    }
    
    func encode(with coder: NSCoder) {
        typealias key = CodingKeys
        coder.encode(self.products, forKey: key.products.identifier)
    }
    
    override init() {
    }
}
