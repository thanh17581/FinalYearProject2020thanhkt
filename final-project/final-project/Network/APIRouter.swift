//
//  APIRouter.swift
//  final-project
//
//  Created by Vinsofts on 11/16/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter : URLRequestConvertible {
        
    case HOME
    case getRestaurantData(id: Int)
    case getFoodData(id: Int)
    
    var method : HTTPMethod {
        switch self {
        case .HOME, .getFoodData, .getRestaurantData:
            return .get
        }
    }
    
    var parameters : Parameters? {
        switch self {
        case .getRestaurantData(let id):
            return ["id" : id]
        case .getFoodData(let id):
            return ["id" : id]
        default:
            return nil
        }
    }
    
    var path : String {
        switch self {
        case .HOME:
            return "home"
        case .getRestaurantData:
            return "getRestaurantData"
        case .getFoodData:
            return "getFoodData"
        }
    }
    
    var encoding: ParameterEncoding{
        switch self{
        default:
            return URLEncoding.default
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseURL.asURL().appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        // request Headers
        request.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        
        if let parameters = parameters {
            return try encoding.encode(request, with: parameters)
        }
        
        return request
    }
}
