//
//  SignUpInteractor.swift
//  QueerGOUser
//
//  Created by Bresnier Moreno on 23/7/24.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import SwiftUI
import PhotosUI

@available(iOS 17.0, *)
class SignUpInteractor: UIViewController, ObservableObject {
    
//     Guardar imagen de perfil seleccionada en UserDefaults.
    
    @Published var image = Image("Avatar_1")
    @Published var photoSelection: PhotosPickerItem? {
        didSet {
            if let photoSelection {
                loadTransferable(from: photoSelection)
            }
        }
    }
    
    private func loadTransferable(from photoSelection: PhotosPickerItem) {
        photoSelection.loadTransferable(type: Data.self) { result in
            DispatchQueue.main.async {
                guard photoSelection == self.photoSelection else { return }
                switch result {
                case .success(let data):
                    let uiImage = UIImage(data: data!)
                    self.image = Image(uiImage: uiImage!)
                    self.saveImage(image: uiImage)
                case .failure(let error):
                    print("error load transferable \(error)")
                    self.image = Image("Avatar_1")
                }
            }
        }
    }
    
    func saveImage(image: UIImage?) {
        guard let image = image, let data = image.pngData() else { return }
        UserDefaults.standard.set(data, forKey: "savedImage")
    }

    func loadImage() -> UIImage? {
        guard let data = UserDefaults.standard.data(forKey: "savedImage") else { return nil }
        return UIImage(data: data)
    }
    
    // .
    
    struct infoItemData {
        var sKey: String
        var sValue: String
    }
    
    func postSignIn() {
        
        var userFullData = [infoItemData]()
        
        userFullData.append(infoItemData(sKey: "name", sValue: "Pablo"))
        userFullData.append(infoItemData(sKey: "last_name", sValue: "Benzo"))
        userFullData.append(infoItemData(sKey: "email", sValue: "pablobenzo5@gmail.com"))
        userFullData.append(infoItemData(sKey: "dni", sValue: "pablobenzo5@gmail.com"))
        userFullData.append(infoItemData(sKey: "password", sValue: "queergo1990"))
        userFullData.append(infoItemData(sKey: "password_confirmation", sValue: "queergo1990"))
        userFullData.append(infoItemData(sKey: "pronoun", sValue: "el"))
        userFullData.append(infoItemData(sKey: "number_phone", sValue: "1130123456"))
        userFullData.append(infoItemData(sKey: "gender", sValue: "hombre"))
        
    
        
        var url = "https://api.queergo.com/api/user/createUser"
        
        var serializer = DataResponseSerializer(emptyResponseCodes: Set([201, 422, 500]))
        
        var userDataRequest = URLRequest(url: URL(string: url)!)
        userDataRequest.httpMethod = HTTPMethod.post.rawValue
        
        
        
        AF.upload(multipartFormData: { multipartFormData in
            
            for item in userFullData {
                multipartFormData.append(Data(item.sValue.utf8), withName: item.sKey)
            }
            
            
        }, to: url, method: .post)
        
        .uploadProgress { progress in
            
            print(CGFloat(progress.fractionCompleted))
            
        }
        
        .response { response in
            
            if (response.error == nil) {
                
                var responseString: String?
                
                if(response.data != nil) {
                    
                    responseString = String(bytes: response.data!, encoding: .utf8)!
                    
                } else {
                    responseString = response.response?.description
                }
                
                print(responseString ?? "")
                print(response.response?.statusCode)
                
                var token: NSData = response.data! as NSData
            }
        }
        
    }
}
