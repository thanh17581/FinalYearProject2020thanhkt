//
//  CityHeaderSectionTableViewCell.swift
//  final-project
//
//  Created by Vinsofts on 11/17/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit

class CityHeaderSectionTableViewCell: UITableViewHeaderFooterView {

    @IBOutlet weak var lblLocation: UILabel!
    
    var location: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let location = location {
            self.lblLocation.text = location
        }
    }    
}
