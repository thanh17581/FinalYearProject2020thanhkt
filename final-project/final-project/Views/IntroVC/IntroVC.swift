//
//  IntroVC.swift
//  ios-photo-vault
//
//  Created by Vinsofts on 8/24/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit
import Alamofire


class IntroVC: BaseVC {
    
    //Mark: Properties
    
    //entities
    var imgArr = [
        UIImage(named: "img-first"),
        UIImage(named: "img-second"),
        UIImage(named: "img-third")
    ]
    var MainContentArr = [
        "Receive a table",
        "Popular Dishes",
        "Serving High Quality Food"
    ]
    var DescriptionArr = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    ]
    var pagerview: UIPageViewController?
    var IntroVCs = [UIViewController]()
    var counter = 0
    
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SettingPageView()
        self.btnContinue.layer.cornerRadius = 25
        pagerview?.disableSwipeGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SettingUI()
    }
    
    @IBAction func OnBtnCloseTapped(_ sender: Any) {
        let vc = LoginVC()
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func OnBtnContinueTapped(_ sender: Any) {
        switch counter {
        case 0:
            counter+=1
        case 1:
            counter+=1
        case 2:
            getDateAPI()
            let vc = LoginVC()
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            return
        }
        SettingUI()
    }
    
    func SettingPageView() {
        pagerview = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pagerview?.delegate = self
        pagerview?.dataSource = self
        pagerview?.modalPresentationStyle = .fullScreen
        pagerview?.modalTransitionStyle = .coverVertical
        self.contentView.addSubview(pagerview?.view ?? UIView())
        pagerview?.view.frame = contentView.bounds
        pagerview?.didMove(toParent: self)
    }
    
    func getDateAPI() {
        AF.request(Constants.baseURL + "restaurant").responseString { (response) in
            switch response.result {
            case .success(let responseString):
                guard let responseData = RestaurantModel(JSONString: responseString) else {return}
                dataRestaurant.removeAll()
                dataRestaurant.append(contentsOf: responseData.dataR!)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
        
        AF.request(Constants.baseURL + "food").responseString { (response) in
            switch response.result {
            case .success(let responseString):
                guard let responseData = FoodModel(JSONString: responseString) else {return}
                dataFood.removeAll()
                dataFood.append(contentsOf: responseData.dataF!)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
        
        AF.request(Constants.baseURL + "category").responseString { (response) in
            switch response.result {
            case .success(let responseString):
                guard let responseData = CategoryModel(JSONString: responseString) else {return}
                dataCategory.removeAll()
                dataCategory.append(contentsOf: responseData.dataC!)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func SettingUI() {
        switch counter {
        case 0:
            let vc = IntroChildrenViewController()
            vc.imgData = self.imgArr[counter]!
            vc.lblTitleData = self.MainContentArr[counter]
            vc.lblDes = DescriptionArr[counter]
            pagerview?.setViewControllers([vc], direction: .reverse, animated: false, completion: nil)
        case 1:
            let vc = IntroChildrenViewController()
            vc.imgData = self.imgArr[counter]!
            vc.lblTitleData = self.MainContentArr[counter]
            vc.lblDes = DescriptionArr[counter]
            pagerview?.setViewControllers([vc], direction: .reverse, animated: false, completion: nil)
        case 2:
            let vc = IntroChildrenViewController()
            vc.imgData = self.imgArr[counter]!
            vc.lblTitleData = self.MainContentArr[counter]
            vc.lblDes = DescriptionArr[counter]
            pagerview?.setViewControllers([vc], direction: .reverse, animated: false, completion: nil)
        default:
            return
        }
    }
}

extension IntroVC : UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    
}
