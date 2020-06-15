//
//  Session.swift
//  ProjetoeArquitetura
//
//  Created by Guilherme Deconto on 15/06/20.
//  Copyright © 2020 Guilherme Deconto. All rights reserved.
//

import Foundation

enum SessionDataType: String {
    case bool
    case string
    case object
}

enum SessionData: String {
    
    case cartList
    
    var type: SessionDataType {
        switch self {
        case .cartList:
            return .object
        }
    }
    
}

final class Session {
    
    public static var shared = Session()
    
    var cartList: ProductList {
        set {
            update(.cartList, value: newValue)
        }
        get {
            guard let cartList = load(.cartList) as? ProductList else { return ProductList.init() }
            return cartList
        }
    }
    
    private func update(_ data: SessionData, value: Any?) {
        switch data.type {
        case .object:
            guard let value = value else {
                UserDefaults.standard.set(nil, forKey: data.rawValue)
                UserDefaults.standard.synchronize()
                
                return
            }
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: value)
            UserDefaults.standard.set(encodedData, forKey: data.rawValue)
            UserDefaults.standard.synchronize()
        default:
            UserDefaults.standard.set(value, forKey: data.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
    private func load(_ data: SessionData) -> Any? {
        switch data.type {
        case .string:
            return UserDefaults.standard.string(forKey: data.rawValue)
        case .bool:
            return UserDefaults.standard.bool(forKey: data.rawValue)
        case .object:
            guard let decoded = UserDefaults.standard.object(forKey: data.rawValue) as? Data else {
                return nil
            }
            return NSKeyedUnarchiver.unarchiveObject(with: decoded)
        }
    }
}
