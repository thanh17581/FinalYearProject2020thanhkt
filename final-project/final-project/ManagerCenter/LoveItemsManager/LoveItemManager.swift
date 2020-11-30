//
//  LoveItemManager.swift
//  final-project
//
//  Created by Vinsofts on 11/16/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import Foundation

class LovedManager {
    var items = [dataR]()
    
    static let shared = LovedManager()
    
    func addItem(_ item: dataR?) {
        guard let item = item else {
            print("Restaurant Nil")
            return
        }
        if items.firstIndex(where: { (arrayItem) -> Bool in
            return arrayItem.id == item.id
        }) == nil {
            var LikedItem = item
            LikedItem.liked = true
            items.append(LikedItem)
        } else {
            print("Can't add restaurant!")
        }
        
    }
    
    func removeItem(_ item: dataR?) {
        guard let item = item else { return }
        if let index = items.firstIndex(where: { (arrayItem) -> Bool in
            return arrayItem.id == item.id
        }) {
            items.remove(at: index)
        }
    }
    
    var totalItems: Int {
        return items.count
    }
    
}
