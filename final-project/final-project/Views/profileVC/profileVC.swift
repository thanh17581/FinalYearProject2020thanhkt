//
//  profileVC.swift
//  final-project
//
//  Created by Apple on 11/29/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit

class profileVC: BaseVC {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblWallet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI() {
        self.lblName.text = profile?.name ?? "Khuat Tien Thanh"
        self.lblEmail.text = profile?.email ?? "thanhktgch17581@fpt.edu.vn"
        self.lblWallet.text = "500.000"
    }
    
    @IBAction func backAct(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func OnBtnSighOutTapped(_ sender: Any) {
        let vc = LoginVC()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func OnBtnYourCartTapped(_ sender: Any) {
        let vc = CartVC()
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
