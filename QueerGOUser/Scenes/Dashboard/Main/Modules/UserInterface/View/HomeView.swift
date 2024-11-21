//
//  HomeView.swift
//  QueerGOUser
//
//  Created by Bresnier Moreno on 17/7/24.
//

import UIKit
import SwiftUI

@available(iOS 17.0, *)
struct HomeView: View {
    
    private let modelTop = ModelTop()
    
    var body: some View {
        NavigationStack {
            TabView {
                MapContentView()
                    .tabItem {
                        ScaledImage(name: "coche.png", size: CGSize(width: 30, height: 30))
                        Text("Viajar")
                    }
                
                LoginView()
                    .tabItem {
                        ScaledImage(name: "button_go_on", size: CGSize(width: 150, height: 70))
                        Text("")
                    }
                
                ProfileImageView()
                    .tabItem {
                        ScaledImage(name: "enviar-datos", size: CGSize(width: 30, height: 30))
                        Text("Enviar")
                    }
            }
            .accentColor(.gray)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    
                    Button(action: {
                        //
                    }) {
                        NavigationLink(destination: ProfileView()) {
                            Image("mi_cuenta")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                        }
                        
                    }
                }
            }
            
        }
    }
}


struct ScaledImage: View {
    let name: String
    let size: CGSize
    
    var body: Image {
        let uiImage = resizedImage(named: self.name, for: self.size) ?? UIImage()
        
        return Image(uiImage: uiImage.withRenderingMode(.alwaysOriginal))
    }
    
    func resizedImage(named: String, for size: CGSize) -> UIImage? {
        guard let image = UIImage(named: named) else {
            return nil
        }

        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    HomeView()
}
