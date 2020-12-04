//
//  LoveRestaurantVC.swift
//  final-project
//
//  Created by Vinsofts on 11/17/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit
import CRRefresh

class LoveRestaurantVC: BaseVC {

    @IBOutlet weak var tableView: UITableView!
    
    var arrLovedRestaurant = [dataR]()
    var RestaurantTableViewCell = "RestaurantTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getLovedRestaurant()
    }
    
    func getLovedRestaurant() {
        arrLovedRestaurant = LovedManager.shared.items
        tableView.reloadData()
    }
    
    func initUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: RestaurantTableViewCell, bundle: nil), forCellReuseIdentifier: RestaurantTableViewCell)
        tableView.backgroundColor = .clear
        arrLovedRestaurant = LovedManager.shared.items
        tableView.reloadData()
        tableView.cr.addHeadRefresh(animator: SlackLoadingAnimator()) { [weak self] in
            self?.getLovedRestaurant()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self?.tableView.cr.endHeaderRefresh()
            })
        }
        let fView = UIView()

        tableView.tableFooterView = fView
    }
    
    @IBAction func backAct(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension LoveRestaurantVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrLovedRestaurant.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell, for: indexPath) as! RestaurantTableViewCell
        let item = arrLovedRestaurant[indexPath.row]
        cell.configure(item)
        cell.delegate = self
        cell.bgColor(.clear)
        return cell
    }
    
    private func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrLovedRestaurant.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {  }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = RestaurantDetailVC()
        vc.data = self.arrLovedRestaurant[indexPath.row]
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

extension LoveRestaurantVC: LoveRestaurantDelegate {
    func loveRestaurant(rest: dataR) { }
    func disLoveRestaurant(rest: dataR) {
        if let row = arrLovedRestaurant.firstIndex(where: { (restaurant) -> Bool in
            restaurant.id == rest.id
        }) {
            print("removing a restaurant from loved ...")
            arrLovedRestaurant.remove(at: row)
            tableView.reloadData()
        }
    }
}
