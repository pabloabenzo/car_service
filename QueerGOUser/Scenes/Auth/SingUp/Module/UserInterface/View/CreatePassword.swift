//
//  CreatePassword.swift
//  QueerGOUser
//
//  Created by Pablo Benzo on 20/08/2024.
//

import SwiftUI

@available(iOS 17.0, *)
struct CreatePassword: View {
    
    var modelTop = ModelTop()
    var signUpInteractor = SignUpInteractor()
    
    @Environment(\.dismiss) var dismiss
    
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    @State private var isNavigating = false
    @State private var isLoading = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .foregroundColor(modelTop.colorManager(color: "primary"))
                    .edgesIgnoringSafeArea(.top)
                    .frame(width: modelTop.deviceWidth, height: modelTop.deviceHeight)
                
                ZStack{
                    Rectangle()
                        .foregroundColor(modelTop.colorManager(color: "base_white"))
                        .edgesIgnoringSafeArea(.top)
                        .frame(width: modelTop.deviceWidth, height: 150)
                        .padding(.bottom, modelTop.deviceHeight)
                    
                    Image("wall_q")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom, modelTop.deviceHeight / 5)
                }
                
                VStack {
                    
                    VStack {
                        
                        modelTop.textLabel("Definir contraseña", .custom("OpenSansRoman-Bold", size: 22), fontColor: "base_black")
                            .frame(width: 350, alignment: .leading)
                            .padding(.top, modelTop.deviceHeight / 50).padding(.leading, modelTop.deviceWidth / 25)
                        
                        modelTop.textLabel("Debe tener al menos 8 carácteres y no incluir la palabra “Queergo” o tu email.", .custom("OpenSansRoman-SemiBold", size: 14), fontColor: "primary")
                            .frame(width: 350, alignment: .leading)
                            .padding(.top, -10).padding(.bottom, 20).padding(.leading, modelTop.deviceWidth / 25)
                    }
                    
                    VStack {
                        
                        HStack {
                            
                            SecureField("", text: $password, prompt: Text("Nueva contraseña").foregroundColor(modelTop.colorManager(color: "base_black")))
                                .keyboardType(.default)
                                .font(.custom("OpenSansRoman-SemiBold", size: 16))
                            
                            Image("ojo_password")
                                .resizable()
                                .frame(width: 40, height: 22)
                            
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color(modelTop.colorManager(color: "primary")), lineWidth:3))
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 0)
                        
                        HStack {
                            
                            SecureField("", text: $confirmPassword, prompt: Text("Nueva contraseña").foregroundColor(modelTop.colorManager(color: "base_black")))
                                .keyboardType(.default)
                                .font(.custom("OpenSansRoman-SemiBold", size: 14))
                            
                            Image("ojo_password")
                                .resizable()
                                .frame(width: 40, height: 22)
                            
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color(modelTop.colorManager(color: "primary")), lineWidth:3))
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, modelTop.deviceHeight / 4.5).padding(.top, 20)
                        
                    }
                    .padding()
                    
                    VStack {
                        Image("queergo_logo_white")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, maxHeight: modelTop.deviceHeight / 4.5)
                        
                        Button(action: loadAndNavigate) {
                            
                            modelTop.textLabel("Confirmar contraseña", .custom("OpenSansRoman-SemiBold", size: 18), fontColor: "primary")
                        }
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(modelTop.colorManager(color: "base_white"))
                        .cornerRadius(6)
                        .padding()
                    }
                    
                }
                
                if isLoading {
                    ZStack {
                        Color.gray.opacity(0.3)
                            .edgesIgnoringSafeArea(.all)
                        ProgressView("")
                            .progressViewStyle(CircularProgressViewStyle())
                        
                        NavigationLink(
                            destination: ProfileImageView(),
                            isActive: $isNavigating
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
}

@available(iOS 17.0, *)
#Preview {
    CreatePassword()
}
