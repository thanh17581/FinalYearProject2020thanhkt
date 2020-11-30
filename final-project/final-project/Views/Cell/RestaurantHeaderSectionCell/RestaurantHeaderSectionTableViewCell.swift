//
//  RestaurantHeaderSectionTableViewCell.swift
//  final-project
//
//  Created by Vinsofts on 11/17/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit

class RestaurantHeaderSectionTableViewCell: UITableViewHeaderFooterView {

    @IBOutlet weak var contenterView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contenterView.layer.cornerRadius = 20
        contenterView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }    
}
