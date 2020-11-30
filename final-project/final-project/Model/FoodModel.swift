//
//  FoodModel.swift
//  final-project
//
//  Created by Vinsofts on 11/16/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class FoodModel: Mappable {
    
    var dataF: [dataF]?
    var message: String?
    var status: Int?
    
    required init?(map: Map) {  }
    
    func mapping(map: Map) {
        dataF <- map["data"]
        message <- map["message"]
        status <- map["status"]
    }
}

class dataF: Mappable {
    var id: Int?
    var image: String?
    var name: String?
    var price: String?
    var rating: Int?
    var ratingCount: Int?
    var quantity = 0
    
    required init?(map: Map) {  }
    
    func mapping(map: Map) {
        id <- map["id"]
        image <- map["image"]
        name <- map["name"]
        price <- map["price"]
        rating <- map["rating"]
        ratingCount <- map["ratingCount"]
    }
}




