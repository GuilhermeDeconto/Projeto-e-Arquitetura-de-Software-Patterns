//
//  AddProductViewController.swift
//  ProjetoeArquitetura
//
//  Created by Guilherme Deconto on 15/06/20.
//  Copyright © 2020 Guilherme Deconto. All rights reserved.
//

import UIKit

protocol AddProductViewControllerDelegate {
    func didGoBack()
}

class AddProductViewController: UIViewController {
    
    @IBOutlet weak var tfQuantity: UITextField!
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var btnAddItem: BorderButton!
    var delegate: AddProductViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func didPressContinue(_ sender: Any) {
        //Simple verification in order to continue
        if tfName.text != nil && tfName.text != ""{
            //Call facade to create product and add the new product in User Default
            if AddProductFachada.init().save(name: tfName.text ?? "", price: tfValue.text ?? "", quantity: tfQuantity.text ?? "") {
                dismiss(animated: true) {
                    self.delegate?.didGoBack()
                }
            }
        }
    }
}

class AddProductFachada {
    
    var product: Product = Product.init()
    
    //Create a new product and add it in User Default
    func save(name: String, price: String, quantity: String) -> Bool {
        self.product.name = name
        self.product.price = price
        self.product.quantity = quantity
        
        let productList = Session.shared.cartList
        productList.products.append(self.product)
        Session.shared.cartList = productList
        
        return true
    }
    
}
