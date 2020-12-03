//
//  RestaurantVC.swift
//  final-project
//
//  Created by Vinsofts on 11/17/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit
import Alamofire

class RestaurantVC: BaseVC {

    @IBOutlet weak var tableView: UITableView!
    
    var Restaurants: [dataR]?
    let RestaurantTableViewCell = "RestaurantTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        getData()
    }
    
    //MARK: functions
    
    func initUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: RestaurantTableViewCell, bundle: nil), forCellReuseIdentifier: RestaurantTableViewCell)
        let fView = UIView()
        tableView.tableFooterView = fView
    }
    
    func getData() {
        self.Restaurants = dataRestaurant
    }
    
    //MARK: actions
    @IBAction func backAct(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: extensions
extension RestaurantVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell, for: indexPath) as! RestaurantTableViewCell
        cell.configure(Restaurants?[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Restaurants?.count ?? 0
    }

}

extension RestaurantVC: LoveRestaurantDelegate {
    
    func loveRestaurant(rest: dataR) {
        if let row = Restaurants?.firstIndex(where: { (restaurant) -> Bool in
            restaurant.id == rest.id
            }) {
            self.Restaurants?[row].liked = true
            let indexPath = IndexPath(row: row, section: 1)
            tableView.reloadRows(at: [indexPath], with: .fade)
        } else {
            print("error love restaurant")
        }
    }
    
    func disLoveRestaurant(rest: dataR) {
        if let row = Restaurants?.firstIndex(where: { (restaurant) -> Bool in
            restaurant.id == rest.id
        }) {
            self.Restaurants?[row].liked = false
            let indexPath = IndexPath(row: row, section: 1)
            tableView.reloadRows(at: [indexPath], with: .fade)
        } else {
            print("error dislove restaurant")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = RestaurantDetailVC()
        vc.data = self.Restaurants?[indexPath.row]
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.navigationController?.pushViewController(vc, animated: true)
        
//        self.view.makeToastActivity(.center)
//        if let url = URL(string: "\(Constants.baseURL)retaurantFood") {
//            let idR = Restaurants?[indexPath.row].id
//                AF.request("\(url)?id=\(idR ?? 0)", method: .post).responseString { (response) in
//                    switch response.result {
//                    case .success(let responseString):
//                        guard let FResponse = FoodModel(JSONString: responseString) else {return}
//                        if let statusLogin = FResponse.status {
//                            if statusLogin == 200 {
//                                self.view.hideToastActivity()
//                                let vc = RestaurantDetailVC()
//                                vc.data = self.Restaurants?[indexPath.row]
//                                vc.foodData = FResponse.dataF
//                                vc.modalPresentationStyle = .fullScreen
//                                vc.modalTransitionStyle = .coverVertical
//                                self.navigationController?.pushViewController(vc, animated: true)
//                            } else {
//                                self.CreateAlert(title: "Notification", message: "Your account is not available")
//                            }
//                        }
//                    case .failure(let err):
//                        print(err.localizedDescription)
//                        self.CreateAlert(title: "Notification", message: "Your connection have some problems")
//                    }
//                }
//            }
    }
}

