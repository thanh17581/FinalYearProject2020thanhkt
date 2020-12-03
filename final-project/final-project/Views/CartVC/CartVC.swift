//
//  CartVC.swift
//  final-project
//
//  Created by Vinsofts on 11/16/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit
import Toast_Swift

class CartVC: BaseVC {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblTotalCartPrice: UILabel!
    @IBOutlet weak var BtnCheckout: UIButton!
    
    let CartTableViewCell = "CartTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    @objc func refresh() {
        lblTotalCartPrice.text = "\(bill)"
    }
    
    func initUI() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: CartTableViewCell, bundle: nil), forCellReuseIdentifier: CartTableViewCell)
//        if CartManager.shared.items.isEmpty {
//            BtnCheckout.isEnabled = false
//            BtnCheckout.alpha = 0.4
//        }
        NotificationCenter.default.addObserver(self, selector: #selector(self.refresh), name: NSNotification.Name(rawValue: "updateBill"), object: nil)
        lblTotalCartPrice.text = "\(bill)"
        cart.forEach { (F) in
            bill = bill + (Int(F.price ?? "0") ?? 0)
        }
        BtnCheckout.layer.cornerRadius = BtnCheckout.frame.size.height / 2
        let fView = UIView()
        tableView.tableFooterView = fView
        
    }
    @IBAction func OnBtnCheckoutTapped(_ sender: Any) {
//        let items = CartManager.shared.items
        self.view.makeToastActivity(.center)

    }
    @IBAction func backAct(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension CartVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell, for: indexPath) as! CartTableViewCell
        cell.configureCartTableViewCellWith(item: cart[indexPath.row])
        return cell
    }
    
    private func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cart.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {  }
    }
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        if ed
//    }
//
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            cart.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {  }
//    }
}
