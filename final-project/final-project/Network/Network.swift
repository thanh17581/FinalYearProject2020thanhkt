//
//  Network.swift
//  final-project
//
//  Created by Vinsofts on 11/16/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class Network {
    typealias onSuccess<T> = ( (T, String) -> ())
    typealias onFailure = ((_ error: Error) -> ())
    
    static func performRequest<T>(_ object: T.Type, router: APIRouter, success: @escaping onSuccess<T>, failure: @escaping onFailure) where T:Decodable {
        
        AF.request(router).responseJSON { (response) in
            
            if let err = response.error {
                failure(err)
                return
            }
            
            do {
                let data = try JSONDecoder().decode(AppModel<T>.self, from: response.data!)
                
                if data.status == .fail {
                    failure(BaseError.other(text: data.message ?? ""))
                    return
                } else {
                    if let datax = data.data {
                        success(datax, data.message ?? "No message")
                    }
                }
            } catch let err {
                failure(err)
            }
        }
    }
}
