//
//  SignupVC.swift
//  final-project
//
//  Created by Vinsofts on 11/10/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit
import Alamofire

class SignupVC: BaseVC {

    @IBOutlet weak var btnCreateAccount: UIButton!
    @IBOutlet weak var txtFullname: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var fullnameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI() {
        self.view.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.3058823529, blue: 0.3529411765, alpha: 1)
        self.btnCreateAccount.layer.cornerRadius = 36
        self.fullnameView.layer.cornerRadius = 8
        self.emailView.layer.cornerRadius = 8
        self.passwordView.layer.cornerRadius = 8
        self.txtPassword.isSecureTextEntry = true
    }

    @IBAction func OnBtnCreateAccountTapped(_ sender: Any) {
        if txtFullname.text?.trimmingCharacters(in: .whitespaces) == "" || txtEmail.text?.trimmingCharacters(in: .whitespaces) == "" || txtPassword.text?.trimmingCharacters(in: .whitespaces) == "" {
            CreateAlert(title: "Notification", message: "Please input all textfield")
        } else {
            if let url = URL(string: "\(Constants.baseURL)signup") {
                let username = txtEmail.text
                let password = txtPassword.text
                let email = txtEmail.text
                let name = txtFullname.text
                    AF.request("\(url)?username=\(username ?? "abc")&password=\(password ?? "abc")&email=\(email ?? "abc@abc.com")&name=\(name ?? "Tony")", method: .post).responseString { (response) in
                        switch response.result {
                        case .success(let responseString):
                            guard let loginResponse = loginModel(JSONString: responseString) else {return}
                            if let statusLogin = loginResponse.status {
                                if statusLogin == 200 {
                                    userName = username
                                    passWord = password
                                    let vc = HomeVC()
                                    vc.modalPresentationStyle = .fullScreen
                                    vc.modalTransitionStyle = .crossDissolve
                                    self.navigationController?.pushViewController(vc, animated: true)
                                } else {
                                    self.CreateAlert(title: "Notification", message: "Please enter your information again!")
                                }
                            }
                        case .failure(let err):
                            print(err.localizedDescription)
                            self.CreateAlert(title: "Notification", message: "Your connection have some problems")
                        }
                    }
                }
        }
    }
    
    @IBAction func OnBtnSignInTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func backAct(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
