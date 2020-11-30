//
//  Category.swift
//  final-project
//
//  Created by Vinsofts on 11/16/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class CategoryModel: Mappable {
    var dataC: [dataC]?
    var message: String?
    var status: Int?
    
    required init?(map: Map) {  }
    
    func mapping(map: Map) {
        dataC <- map["data"]
        message <- map["message"]
        status <- map["status"]
    }
}

class dataC: Mappable {
    var id: Int?
    var name: String?
    var image: String?
    
    required init?(map: Map) {  }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        image <- map["image"]
    }
}
