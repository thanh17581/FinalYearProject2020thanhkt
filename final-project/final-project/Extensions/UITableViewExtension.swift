//
//  UITableViewExtension.swift
//  final-project
//
//  Created by Vinsofts on 11/17/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerHeaderNib<Cell: UITableViewHeaderFooterView>(cellClass: Cell.Type){
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forHeaderFooterViewReuseIdentifier: String(describing: Cell.self))
    }
    
}
