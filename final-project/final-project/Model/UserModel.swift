////
////  UserModel.swift
////  final-project
////
////  Created by Apple on 11/23/20.
////  Copyright © 2020 Vinsofts. All rights reserved.
////
//
import Foundation
import ObjectMapper


class AccountModel: Mappable {
    
    var data: UserDetail?
    var message: String?
    var status: Int?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        data <- map["data"]
        message <- map["message"]
        status <- map["status"]
    }
}

class UserDetail: Mappable {
    
    var id: String?
    var username: String?
    var password: String?
    var name: String?
    var age: String?
    var email: String?
    var wallet: Int?
    init() {}
    required init?(map: Map) {  }
    
    func mapping(map: Map) {
        id <- map["id"]
        username <- map["username"]
        password <- map["password"]
        name <- map["name"]
        age <- map["age"]
        email <- map["email"]
        wallet <- map["wallet"]
    }
    
    
}

