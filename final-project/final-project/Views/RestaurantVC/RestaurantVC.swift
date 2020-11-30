//
//  RestaurantVC.swift
//  final-project
//
//  Created by Vinsofts on 11/17/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit

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
        vc.data = Restaurants?[indexPath.row]
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

