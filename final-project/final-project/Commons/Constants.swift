//
//  Constants.swift
//  final-project
//
//  Created by Vinsofts on 11/10/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit

struct Colors {
    static let backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 1, alpha: 1)
}

struct Constants {
    static let baseURL = "http://127.0.0.1:5000/"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/x-www-form-urlencoded; charset=utf-8"
    case accept = "*/*"
    case acceptEncoding = "gzip;q=1.0, compress;q=0.5"
}

var dataCategory = [dataC]()
var dataFood = [dataF]()
var dataRestaurant = [dataR]()
var dataPopularFood = [dataF]()
var profile : UserDetail?
var userName : String?
var passWord : String?
var cart = [dataF]()
var bill = 0

enum homevc {
    case popular
    case all
    case none
}

class UserInfor {
    static let shared = UserInfor()
    var profile : UserDetail?
}

class FoodInfo {
    static let shared = FoodInfo()
    var res1 = [dataF]()
    var res2 = [dataF]()
    var res3 = [dataF]()
    var res4 = [dataF]()
    var res5 = [dataF]()
}
