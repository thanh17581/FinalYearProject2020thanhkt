//
//  HomeModel.swift
//  final-project
//
//  Created by Vinsofts on 11/17/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import Foundation
import ObjectMapper

// MARK: - Home
struct Home: Codable {
    let title: String?
    var types: [CircleModel]?
}

// MARK: - TypeElement
struct CircleModel: Codable {
    let id: Int?
    let image: String?
    let title: String?
    var isSelected: Bool? = false
}

class loginModel: Mappable {
    var message: String?
    var status: Int?
    
    required init?(map: Map) {   }
    
    func mapping(map: Map) {
        message <- map["message"]
        status <- map["status"]
    }
}
