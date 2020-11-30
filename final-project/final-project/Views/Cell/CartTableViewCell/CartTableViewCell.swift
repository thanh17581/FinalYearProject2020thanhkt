//
//  CartTableViewCell.swift
//  final-project
//
//  Created by Vinsofts on 11/16/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit
import Kingfisher

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
//    @IBOutlet weak var customAmountView: CustomAmountView!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemTotal: UILabel!
    
    var item: dataF?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        customAmountView.didPressOnButton = { item in
//            switch item {
//            case .plus:
//                CartManager.shared.addItem(self.item!)
//                print("item added")
//            case .minus:
//                CartManager.shared.removeItem(self.item!)
//                print("item removed")
//            }
//        }
    }
    
    func configureCartTableViewCellWith(item: dataF) {
        self.item = item
        
        if let image = item.image {
            img.kf.indicatorType = .activity
            img.kf.setImage(with: URL(string: image))
        }
        itemTitle.text = item.name ?? ""
        itemDescription.text = ""
        itemPrice.text = "\(item.price ?? "") per one"
//        customAmountView.count = item.quantity
        itemTotal.text = item.price ?? ""
        bill = bill + Int(itemTotal.text ?? "")!
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateBill"), object: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
