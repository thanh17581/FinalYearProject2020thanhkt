//
//  CartManager.swift
//  final-project
//
//  Created by Vinsofts on 11/16/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import Foundation
import UIKit

class CartManager {
    var items = [dataF]()
    
    static let shared = CartManager()
    
    func addItem(_ item: dataF) {
        
        if let index = items.firstIndex(where: { (arrayItem) -> Bool in
            return arrayItem.id == item.id
        }) {
            items[index].quantity = (items[index].quantity ) + 1
        } else {
            let newItem = item
            newItem.quantity = 1
            items.append(newItem)
        }
    }
    
    func removeItem(_ item: dataF) {
        
//        if let index = items.firstIndex(where: { (arrayItem) -> Bool in
//            return arrayItem.dataF?.first!.id == item.dataF?.first?.id!
//        }) {
//            if (items.first?.dataF?[index].quantity ?? 0) > 1 {
//                items.first?.dataF?[index].quantity = (items.first?.dataF?[index].quantity ?? 0) - 1
//            } else {
//                items.remove(at: index)
//            }
//        }
    }
    
    var totalItems: Int {
        return items.count
    }

}
