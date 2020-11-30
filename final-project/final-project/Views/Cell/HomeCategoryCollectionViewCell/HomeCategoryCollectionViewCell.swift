//
//  HomeCategoryCollectionViewCell.swift
//  final-project
//
//  Created by Vinsofts on 11/11/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit

class HomeCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }
    
    func initUI() {
        self.categoryView.layer.cornerRadius = 32
    }

}
