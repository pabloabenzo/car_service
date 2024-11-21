//
//  PaymentErrorInteractor.swift
//  QueerGOUser
//
//  Created by Bresnier Moreno on 23/7/24.
//

import Foundation
import Alamofire
import SwiftyJSON

class PaymentErrorInteractor: ObservableObject {
    
    @Published var data: Data?
    
    init() {
        
        AF.request("https://api.github.com/users/hadley/orgs").responseData { (data) in
            
            let json = try! JSON(data: data.data!)
            
            for i in json {
                // data
            }
        }
        
    }
}
