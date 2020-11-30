//
//  HomeVC.swift
//  final-project
//
//  Created by Vinsofts on 11/10/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit
import Kingfisher
import Photos
import Alamofire

class HomeVC: BaseVC {
    
    // MARK: outlet + entities

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    let HomeCategoryCollectionViewCell = "HomeCategoryCollectionViewCell"
    var data: Home?
    var Resturants: RestaurantModel?
    var homeVC: homevc = .none
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(UINib(nibName: HomeCategoryCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: HomeCategoryCollectionViewCell)
        getProfileData()
    }
    
    // MARK: function
    
    func getProfileData() {
        if let url = URL(string: "\(Constants.baseURL)profile") {
            let username = userName
            let password = passWord
            AF.request("\(url)?username=\(username ?? "abc")&password=\(password ?? "abc")", method: .post).responseString { (response) in
                switch response.result {
                case .success(let responseString):
                    guard let loginResponse = AccountModel(JSONString: responseString) else {return}
                    if let statusLogin = loginResponse.status {
                        if statusLogin == 200 {
                            UserInfor.shared.profile = loginResponse.data
                            profile = UserDetail()
                            if let id = loginResponse.data?.id {
                                profile?.id = id
                            }
                            if let username = loginResponse.data?.username {
                                profile?.username = username
                            }
                            if let name = loginResponse.data?.name {
                                profile?.name = name
                            }
                            if let password = loginResponse.data?.password {
                                profile?.password = password
                            }
                            if let email = loginResponse.data?.email {
                                profile?.email = email
                            }
                            if let age = loginResponse.data?.age {
                                profile?.age = age
                            }
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
    
    //MARK: actions
    
    @IBAction func OnBtnProfileTapped(_ sender: Any) {
        let vc = profileVC()
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func OnBtnLoveTapped(_ sender: Any) {
        let vc = LoveRestaurantVC()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func OnBtnSeeAllPopularDishesTapped(_ sender: Any) {
        let vc = homedishesVC()
        vc.name = "Popular Dishes"
        vc.hvc = .popular
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func OnBtnSeeAllRestaurantTapped(_ sender: Any) {
        let vc = RestaurantVC()
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func OnBtnSeeAllDishesTapped(_ sender: Any) {
        let vc = homedishesVC()
        vc.name = "All Dishes"
        vc.hvc = .all
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func OnBtnSearchTapped(_ sender: Any) {
        let vc = SearchVC()
        print("abc")
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: extensions

extension HomeVC: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataCategory.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: HomeCategoryCollectionViewCell, for: indexPath) as! HomeCategoryCollectionViewCell
        cell.categoryImage.kf.setImage(with: URL(string: dataCategory[indexPath.item].image ?? ""))
        cell.categoryName.text = dataCategory[indexPath.item].name ?? ""
            return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.width / 5)
    }
    
    
}
