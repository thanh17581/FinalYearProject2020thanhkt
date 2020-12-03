//
//  FoodItemsTableViewCell.swift
//  final-project
//
//  Created by Vinsofts on 11/18/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit

class FoodItemsTableViewCell: BaseTableViewCell {

    @IBOutlet weak var img: UIImageView!
//    @IBOutlet weak var customAmountView: CustomAmountView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    var item: dataF?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }
    
    func initUI() {
//        customAmountView.didPressOnButton = { item in
//            switch item {
//            case .plus:
//                print("pressed plus")
//                CartManager.shared.addItem(self.item!)
//            case .minus:
//                print("pressed minus")
//                CartManager.shared.removeItem(self.item!)
//            }
//            print(CartManager.shared.totalItems)
//        }
    }
    
    override func configure<T>(_ item: T?) {
        guard let item = item as? dataF else { return }
        self.item = item
        self.lblTitle.text = item.name
        self.lblPrice.text = "\(item.price ?? "") VND"
        if let image = item.image {
            img.kf.indicatorType = .activity
            self.img.kf.setImage(with: URL(string: image))
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
