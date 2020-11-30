//
//  BaseTableViewCell.swift
//  final-project
//
//  Created by Vinsofts on 11/16/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import Foundation
import UIKit

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure<T>(_ item: T?){
        guard let _ = item else { return }
    }
}
