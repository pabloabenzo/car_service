//
//  SignUpView.swift
//  QueerGOUser
//
//  Created by Pablo Benzo on 07/08/2024.
//

import SwiftUI

@available(iOS 17.0, *)
struct SignUpView: View {
    
    var modelTop = ModelTop()
    
    @State var usuario: String = ""
    @State var password: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    @State private var isNavigating = false
    @State private var isLoading = false
    @State private var isLoading2 = false
    @State private var isNavigating2 = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .foregroundColor(modelTop.colorManager(color: "secondary"))
                    .edgesIgnoringSafeArea(.top)
                    .frame(width: modelTop.deviceWidth, height: modelTop.deviceHeight)
                ZStack {
                    
                    
                    Image("rectangle_8")
                        .resizable()
                        .frame(width: modelTop.deviceWidth / 1.2, height: modelTop.deviceHeight / 3)
                        .padding(.bottom, modelTop.deviceHeight / 1.4)
                    
                    Image("chiques")
                        .resizable()
                        .frame(width: modelTop.deviceWidth / 1.2, height: modelTop.deviceHeight / 3.2)
                        .padding(.bottom, modelTop.deviceHeight / 1.5)
                    
                    Image("ellipse_3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: modelTop.deviceWidth, height: modelTop.deviceHeight / 1.8)
                        .padding(.top, modelTop.deviceHeight / 2)
                    
                    //                    Button(action: {
                    //                        dismiss()
                    //                    }) {
                    //                        Image("purple_arrow")
                    //                            .resizable()
                    //                            .frame(maxWidth: .infinity, maxHeight: 65)
                    //                            .padding(.trailing, modelTop.deviceWidth / 1.25).padding(.bottom, modelTop.deviceHeight / 1.15)
                    //                    }
                    
                    VStack {
                        
                        VStack {
                            Image("titulo_ir")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: modelTop.deviceWidth / 1.3, height: modelTop.deviceHeight / 31)
                            
                            Image("logo_purple")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: modelTop.deviceWidth / 3, height: modelTop.deviceHeight / 4.5)
                        }
                        .padding(.bottom, modelTop.deviceHeight / -50)
                        
                        ZStack {
                            
                            Rectangle()
                                .foregroundColor(modelTop.colorManager(color: "primary"))
                                .frame(height: 2)
                                .padding(.top, 40).padding(.leading, 35).padding(.trailing, 35)
                            
                            TextField("", text: $usuario, prompt: modelTop.textLabel("Usuarie", .custom("OpenSans-Regular", size: 16), fontColor: "primary"))
                                .keyboardType(.emailAddress)
                                .padding()
                                .cornerRadius(10)
                                .padding(20)
                        }
                        
                        ZStack {
                            
                            Rectangle()
                                .foregroundColor(modelTop.colorManager(color: "primary"))
                                .frame(height: 2)
                                .padding(.top, -25).padding(.leading, 35).padding(.trailing, 35)
                            SecureField("", text: $password, prompt: modelTop.textLabel("Contraseña", .custom("OpenSans-Regular", size: 16), fontColor: "primary"))
                                .keyboardType(.default)
                                .padding()
                                .cornerRadius(10)
                                .padding(.bottom, 90).padding(.leading, 20)
                        }
                        
                        Button(action: loadAndNavigate) {
                            
                            modelTop.textLabel("Inicia Sesión", .custom("OpenSansRoman-Bold", size: 16), fontColor: "base_white")
                            
                        }
                        .frame(width: modelTop.deviceWidth / 2, height: 50)
                        .background(modelTop.colorManager(color: "primary"))
                        .cornerRadius(6)
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        .padding(.bottom, 20).padding(.top, -50)
                        
                        
                        Button(action: loadAndNavigate2) {
                            
                            modelTop.textLabel("Inicia sesión con tu número de móvil", .custom("OpenSansRoman-Bold", size: 16), fontColor: "base_white")
                        }
                        .lineLimit(1)
                        .frame(width: modelTop.deviceWidth / 1.1, height: 50)
                        .background(modelTop.colorManager(color: "primary"))
                        .cornerRadius(6)
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        .padding(.bottom, modelTop.deviceHeight / 2.2)
                        
                    }
                    .padding(.top, modelTop.deviceHeight / 1.50)
                    
                }
                if isLoading {
                    ZStack {
                        Color.gray.opacity(0.3)
                            .edgesIgnoringSafeArea(.all)
                        ProgressView("")
                            .progressViewStyle(CircularProgressViewStyle())
                        
                        NavigationLink(
                            destination: HomeView(),
                            isActive: $isNavigating
                        ) { }
                    }
                } else if isLoading2 {
                    ZStack {
                        Color.gray.opacity(0.3)
                            .edgesIgnoringSafeArea(.all)
                        ProgressView("")
                            .progressViewStyle(CircularProgressViewStyle())
                        
                        NavigationLink(
                            destination: LoginWithMobile(),
                            isActive: $isNavigating2
                        ) { }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image("purple_arrow")
                            .resizable()
                            .frame(width: 30, height: 25)
                    }
                }
            }
            .padding(.top, -modelTop.deviceHeight / 30)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func loadAndNavigate() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isLoading = false
            isNavigating = true
        }
    }
    
    private func loadAndNavigate2() {
        isLoading2 = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isLoading2 = false
            isNavigating2 = true
        }
    }
}


@available(iOS 17.0, *)
#Preview() {
    SignUpView(usuario: "")
}
