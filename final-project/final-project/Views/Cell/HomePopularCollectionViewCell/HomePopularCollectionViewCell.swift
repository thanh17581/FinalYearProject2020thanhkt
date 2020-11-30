//
//  HomePopularCollectionViewCell.swift
//  final-project
//
//  Created by Vinsofts on 11/12/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit

class HomePopularCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodStar1: UIImageView!
    @IBOutlet weak var foodStar2: UIImageView!
    @IBOutlet weak var foodStar3: UIImageView!
    @IBOutlet weak var foodStar4: UIImageView!
    @IBOutlet weak var foodStar5: UIImageView!
    @IBOutlet weak var foodView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }
    
    func initUI() {
        self.foodView.layer.cornerRadius = 32
    }

}
