////
////  LoginTest.swift
////  QueerGOUser
////
////  Created by Pablo Benzo on 19/09/2024.
////
//
//import Foundation
//
//struct UserModel: Decodable {
//    let user: UserData
//    let token: String
//}
//
//struct UserData: Decodable {
//    let id: Int
//    let name: String
//    let last_name: String
//    let email: String
//}
//
//final class ViewModel {
// 
//    
//    func postGoogle() {
//        
//        var url = URL(string: "https://api.queergo.com/api/auth-mobile/google/login")!
//        
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            let episodeModel = try! JSONDecoder().decode(modelTop.UserModel.self, from: data!)
//            print( "Episode Model \(episodeModel)")
//        }.resume()
//    }
//    
//}
