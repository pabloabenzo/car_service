//
//  UserInteractor.swift
//  QueerGOUser
//
//  Created by Pablo Benzo on 05/09/2024.
//

import Foundation
import UIKit
import SwiftUI
import PhotosUI

@available(iOS 17.0, *)
class UserInteractor: UIViewController, ObservableObject {
    
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
        UserDefaults.standard.set(data, forKey: "profileImage")
    }
    
    func loadImage() -> UIImage? {
        guard let data = UserDefaults.standard.data(forKey: "profileImage") else { return nil }
        return UIImage(data: data)
    }
    
}
