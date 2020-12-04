//
//  RestaurantDetailVC.swift
//  final-project
//
//  Created by Vinsofts on 11/17/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit
import Alamofire

class RestaurantDetailVC: BaseVC {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgLove: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ImgHeaderBackground: UIImageView!
    
    var DetailsTitle: String?
    var isLoved: Bool?
    var data: dataR?
    var foodData: [dataF]?
    var FoodItemsTableViewCell = "FoodItemsTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    //MARK: functions
    
    func initUI() {
        getData()
        if let name = data?.name {
            self.lblTitle.text = name
        }
        if let isLoved = data?.liked {
            self.imgLove.image = isLoved ? #imageLiteral(resourceName: "liked") : #imageLiteral(resourceName: "like")
            self.isLoved = isLoved
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: FoodItemsTableViewCell, bundle: nil), forCellReuseIdentifier: FoodItemsTableViewCell)
        tableView.layer.cornerRadius = 10
        self.ImgHeaderBackground.kf.setImage(with: URL(string: (data?.image)!))
        let fView = UIView()
        tableView.tableFooterView = fView
    }
    
    func getData() {
        if let url = URL(string: "\(Constants.baseURL)retaurantFood") {
            let id = data?.id
            AF.request("\(url)?id=\(id ?? 3)", method: .post).responseString { (response) in
                switch response.result {
                case .success(let responseString):
                    guard let resResponse = FoodModel(JSONString: responseString) else {return}
                    if let status = resResponse.status {
                        if status == 200 {
                            if let fooddata = resResponse.dataF {
                                self.foodData = fooddata
                                self.tableView.reloadData()
                            }
                        } else {
                            self.CreateAlert(title: "Notification", message: "This information have some problems")
                        }
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                    self.CreateAlert(title: "Notification", message: "Your connection have some problems")
                }
            }
        }
    }
    
    //MARK: actions
    
    @IBAction func backAct(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func OnBtnLoveRestaurantTapped(_ sender: Any) {
        isLoved = !isLoved!
        self.imgLove.image = isLoved! ? #imageLiteral(resourceName: "liked") : #imageLiteral(resourceName: "like")
    }
    
}

extension RestaurantDetailVC: UITableViewDelegate, UITableViewDataSource {
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section == 0 {
//            let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "RestaurantDetailHeaderCell") as! RestaurantDetailHeaderCell
//            cell.lblTitle.text = data?.name
//            cell.lblDeliveriTime.text = data?.deliveryTime
//            cell.lblRating.text = "\(data?.rating ?? Int(0.0))"
//            cell.lblRatingCount.text = "\(data?.ratingCount ?? 0)"
//            cell.items = data?.genres ?? []
//            return cell
//        } else {
//            let cell = UITableViewHeaderFooterView()
//            cell.textLabel?.text = "Picked for you"
//            cell.contentView.backgroundColor = .white
//            cell.layer.masksToBounds = true
//            cell.layer.cornerRadius = 10
//            return cell
//        }
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if(section == 0){
//            return 160
//        } else {
//            return 40
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return foodData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FoodItemsTableViewCell, for: indexPath) as! FoodItemsTableViewCell
        cell.configure(self.foodData?[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.makeToastActivity(.center)
//        cart.append(foodData![indexPath.item])
        if let foodData = foodData?[indexPath.item] {
            cart.append(foodData)
            self.view.hideToastActivity()
        }
    }
    
    
}
