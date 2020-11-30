//
//  RestaurantModel.swift
//  final-project
//
//  Created by Vinsofts on 11/16/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class RestaurantModel: Mappable {
    
    var dataR: [dataR]?
    var message: String?
    var status: Int?
    
    required init?(map: Map) {  }
    
    func mapping(map: Map) {
        dataR <- map["data"]
        message <- map["message"]
        status <- map["status"]
    }
}

class dataR: Mappable {
    var id: Int?
    var image: String?
    var name: String?
    var place: String?
    var rating: Int?
    var deliveryTime: String?
    var ratingCount: Int?
    var liked = false
    var genres = ["sea food, fast food"]
    
    required init?(map: Map) {  }
    
    func mapping(map: Map) {
        id <- map["id"]
        image <- map["image"]
        name <- map["name"]
        place <- map["place"]
        deliveryTime <- map["deliveryTime"]
        rating <- map["rating"]
        ratingCount <- map["ratingCount"]
    }
}

