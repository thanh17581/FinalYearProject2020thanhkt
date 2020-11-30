//
//  ViewController.swift
//  final-project
//
//  Created by Apple on 11/28/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request(Constants.baseURL + "restaurant").responseString { (response) in
            switch response.result {
            case .success(let responseString):
                print(responseString)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    @IBAction func tapped(_ sender: Any) {
       
    
    }
    
}

