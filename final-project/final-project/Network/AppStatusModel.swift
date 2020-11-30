//
//  AppStatusModel.swift
//  final-project
//
//  Created by Vinsofts on 11/16/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import Foundation

struct AppModel<T: Decodable>: Decodable {
    var status: statusEnum?
    var data: T?
    var message: String?
    
    enum statusEnum: String, Decodable {
        case fail = "fail"
        case success = "success"
    }
}
