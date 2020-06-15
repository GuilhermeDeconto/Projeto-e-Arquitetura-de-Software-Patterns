//
//  CartListViewController.swift
//  ProjetoeArquitetura
//
//  Created by Guilherme Deconto on 15/06/20.
//  Copyright © 2020 Guilherme Deconto. All rights reserved.
//

import UIKit
import PKHUD
class CartListViewController: UIViewController {

    @IBOutlet weak var btnDebit: BorderButton!
    @IBOutlet weak var btnMaster: BorderButton!
    @IBOutlet weak var btnPaypal: BorderButton!
    @IBOutlet weak var tableView: UITableView!
    var productList: [Product]? = []
    
    let cellIdentifier = "CartListTableViewCell"
    let cellNoItems = "noItems"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.productList = Session.shared.cartList.products

    }
    @IBAction func didPressAddItem(_ sender: Any) {
        //Show add item modal using presentation style
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddProductViewController") as! AddProductViewController
        controller.delegate = self
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func didPressDebit(_ sender: Any) {
        //Do some logic depending on Payment method and return something
        let paymentContext = PaymentContext.init(payment: Debit())
        print(paymentContext.payment())
        
        //Get Payment Model depending on payment method
        let paymentModel = PaymentFactory().getPayment(payment: "Debit")
        paymentModel?.message = paymentContext.payment()
        //Show Success Alert
        HUD.flash(.labeledSuccess(title: paymentModel?.name, subtitle: paymentModel?.message), delay: 1.0){ _ in
        }
    }
    @IBAction func didPressMaster(_ sender: Any) {
        //Do some logic depending on Payment method and return something
        let paymentContext = PaymentContext.init(payment: Master())
        print(paymentContext.payment())
        
        //Get Payment Model depending on payment method
        let paymentModel = PaymentFactory().getPayment(payment: "Master")
        paymentModel?.message = paymentContext.payment()
        //Show Success Alert
        HUD.flash(.labeledSuccess(title: paymentModel?.name, subtitle: paymentModel?.message), delay: 1.0){ _ in
        }
    }
    @IBAction func didPressPaypal(_ sender: Any) {
        //Do some logic depending on Payment method and return something
        let paymentContext = PaymentContext.init(payment: Paypal())
        print(paymentContext.payment())
        
        //Get Payment Model depending on payment method
        let paymentModel = PaymentFactory().getPayment(payment: "Paypal")
        paymentModel?.message = paymentContext.payment()
        //Show Success Alert
        HUD.flash(.labeledSuccess(title: paymentModel?.name, subtitle: paymentModel?.message), delay: 1.0){ _ in
        }
    }
}

extension CartListViewController : UITableViewDelegate {
    
}

extension CartListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.productList != nil && !(self.productList?.isEmpty ?? false) {
            return self.productList!.count
        }else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.productList == nil || self.productList?.count == 0 || self.productList?.isEmpty ?? false {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellNoItems, for: indexPath)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CartListTableViewCell
            let product = self.productList?[indexPath.row]
            cell.lbProduct.text = product?.name
            cell.lbPrice.text = product?.price ?? ""
            cell.lbQuantity.text = product?.quantity ?? ""
            return cell
        }
    }
    
}

extension CartListViewController: AddProductViewControllerDelegate {
    //Add item in productList and reload Table View
    func didGoBack() {
        self.productList = Session.shared.cartList.products
        self.tableView.reloadData()
    }
}
