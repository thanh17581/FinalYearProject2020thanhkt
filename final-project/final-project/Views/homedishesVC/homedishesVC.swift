//
//  homedishesVC.swift
//  final-project
//
//  Created by Vinsofts on 11/19/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit

class homedishesVC: BaseVC {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var arrDisplay = dataFood
    var HomePopularCollectionViewCell = "HomePopularCollectionViewCell"
    var name = String()
    var hvc : homevc = .none
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: HomePopularCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: HomePopularCollectionViewCell)
        self.lblTitle.text = name
        switch hvc {
        case .popular:
            arrDisplay = arrDisplay.sorted{$0.rating! > $1.rating!}
        case .all:
            arrDisplay = arrDisplay.sorted{$0.name! < $1.name!}
        case .none:
            return
        }
    }

    @IBAction func backAct(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension homedishesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrDisplay.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePopularCollectionViewCell, for: indexPath) as! HomePopularCollectionViewCell
        if let image = arrDisplay[indexPath.item].image {
            cell.foodImage.kf.setImage(with: URL(string: image))
        }
        if let name = arrDisplay[indexPath.item].name {
            cell.foodName.text = name
        }
        if let star = arrDisplay[indexPath.item].rating {
            switch star {
            case 0:
                cell.foodStar1.image = #imageLiteral(resourceName: "gray-star")
                cell.foodStar2.image = #imageLiteral(resourceName: "gray-star")
                cell.foodStar3.image = #imageLiteral(resourceName: "gray-star")
                cell.foodStar4.image = #imageLiteral(resourceName: "gray-star")
                cell.foodStar5.image = #imageLiteral(resourceName: "gray-star")
            case 1:
                cell.foodStar1.image = #imageLiteral(resourceName: "red-star")
                cell.foodStar2.image = #imageLiteral(resourceName: "gray-star")
                cell.foodStar3.image = #imageLiteral(resourceName: "gray-star")
                cell.foodStar4.image = #imageLiteral(resourceName: "gray-star")
                cell.foodStar5.image = #imageLiteral(resourceName: "gray-star")
            case 2:
                cell.foodStar1.image = #imageLiteral(resourceName: "red-star")
                cell.foodStar2.image = #imageLiteral(resourceName: "red-star")
                cell.foodStar3.image = #imageLiteral(resourceName: "gray-star")
                cell.foodStar4.image = #imageLiteral(resourceName: "gray-star")
                cell.foodStar5.image = #imageLiteral(resourceName: "gray-star")
            case 3:
                cell.foodStar1.image = #imageLiteral(resourceName: "red-star")
                cell.foodStar2.image = #imageLiteral(resourceName: "red-star")
                cell.foodStar3.image = #imageLiteral(resourceName: "red-star")
                cell.foodStar4.image = #imageLiteral(resourceName: "gray-star")
                cell.foodStar5.image = #imageLiteral(resourceName: "gray-star")
            case 4:
                cell.foodStar1.image = #imageLiteral(resourceName: "red-star")
                cell.foodStar2.image = #imageLiteral(resourceName: "red-star")
                cell.foodStar3.image = #imageLiteral(resourceName: "red-star")
                cell.foodStar4.image = #imageLiteral(resourceName: "red-star")
                cell.foodStar5.image = #imageLiteral(resourceName: "gray-star")
            case 5:
                cell.foodStar1.image = #imageLiteral(resourceName: "red-star")
                cell.foodStar2.image = #imageLiteral(resourceName: "red-star")
                cell.foodStar3.image = #imageLiteral(resourceName: "red-star")
                cell.foodStar4.image = #imageLiteral(resourceName: "red-star")
                cell.foodStar5.image = #imageLiteral(resourceName: "red-star")
            default:
                cell.foodStar1.image = #imageLiteral(resourceName: "gray-star")
                cell.foodStar2.image = #imageLiteral(resourceName: "gray-star")
                cell.foodStar3.image = #imageLiteral(resourceName: "gray-star")
                cell.foodStar4.image = #imageLiteral(resourceName: "gray-star")
                cell.foodStar5.image = #imageLiteral(resourceName: "gray-star")
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2.1, height: UIScreen.main.bounds.width / 2.1)
    }
}
