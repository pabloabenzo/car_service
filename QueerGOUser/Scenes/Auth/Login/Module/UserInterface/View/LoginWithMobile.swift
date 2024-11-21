//
//  LoginWithMobile.swift
//  QueerGOUser
//
//  Created by Pablo Benzo on 18/08/2024.
//

import SwiftUI

@available(iOS 17.0, *)
struct LoginWithMobile: View {
    
    var modelTop = ModelTop()
    var signUpInteractor = SignUpInteractor()
    
    @Environment(\.dismiss) var dismiss
    
    @State var phone: String = ""
    @State var sufij: String = ""
    
    @State private var isNavigating = false
    @State private var isLoading = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .foregroundColor( modelTop.colorManager(color: "primary"))
                    .edgesIgnoringSafeArea(.top)
                    .frame(width: modelTop.deviceWidth, height: modelTop.deviceHeight)
                
                ZStack{
                    Rectangle()
                        .foregroundColor( modelTop.colorManager(color: "base_white"))
                        .edgesIgnoringSafeArea(.top)
                        .frame(width: modelTop.deviceWidth, height: 150)
                        .padding(.bottom, modelTop.deviceHeight)
                    
                    Image("wall_q")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom, modelTop.deviceHeight / 5)
                }
                
                VStack{
                    
                    VStack {
                        
                        modelTop.textLabel("Introduce tus datos personales", .custom("montserrat",size: 20).bold(), fontColor: "base_black")
                            .frame(width: 350, alignment: .leading)
                            .lineLimit(1)
                            .padding(.top, modelTop.deviceHeight / 50).padding(.leading, modelTop.deviceWidth / 25)
                        
                        modelTop.textLabel("Los necesitamos para que cada viaje sea seguro", .custom("open sans", size: 16).bold(), fontColor: "primary")
                            .frame(width: 350, alignment: .leading)
                            .padding(.top, -10).padding(.bottom, 20).padding(.leading, modelTop.deviceWidth / 25)
                    }
                    
                    HStack {
                        HStack {
                            
                            TextField("", text: $sufij, prompt:
                                        Text("Prefijo").foregroundColor( modelTop.colorManager(color: "base_black")))
                            .keyboardType(.numberPad)
                            .font(.custom("open sans", size: 16))
                            
                            Image("vector_down")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 12, height: 6)
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color( modelTop.colorManager(color: "primary")), lineWidth:3)).frame(width: 100)
                            .padding(.bottom, 20).padding(.top, 20).padding(.leading, 20).padding(.trailing, 10)
                        
                        TextField("", text: $phone, prompt: Text("Número de teléfono").foregroundColor( modelTop.colorManager(color: "base_black")))
                            .keyboardType(.numberPad)
                            .font(.custom("open sans", size: 16))
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color( modelTop.colorManager(color: "primary")), lineWidth:3))
                            .padding(.bottom, 20).padding(.top, 20).padding(.trailing, 20)
                    }
                    .padding(.bottom, modelTop.deviceHeight / 3.5)
                    
                    VStack {
                        Image("queergo_logo_white")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: modelTop.deviceWidth / 2, height: modelTop.deviceHeight / 6)
                        
                        VStack {
                            Text("Al continuar, aceptas la ")
                                .font(.custom("open sans", size: 14))
                                .foregroundColor( modelTop.colorManager(color: "base_white"))
                            + Text("Politica de privacidad y los Términos de uso ")
                                .font(.custom("open sans", size: 14))
                                .foregroundColor( modelTop.colorManager(color: "secondary"))
                            + Text("de Queergo.")
                                .font(.custom("open sans", size: 14))
                                .foregroundColor( modelTop.colorManager(color: "base_white"))
                        }
                        .frame(width: 350, height: 80)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .padding(.leading, 10)
                        
                        
                        Button(action: loadAndNavigate) {
                            
                            modelTop.textLabel("Siguiente", .custom("open sans", size: 18), fontColor: "primary")
                        }
                        .frame(width: modelTop.deviceWidth / 2, height: 50)
                        .background(modelTop.colorManager(color: "base_white"))
                        .cornerRadius(6)
                    }
                    
                }
                if isLoading {
                    ZStack {
                        Color.gray.opacity(0.3)
                            .edgesIgnoringSafeArea(.all)
                        ProgressView("")
                            .progressViewStyle(CircularProgressViewStyle())
                        
                        NavigationLink(
                            destination: LoginPhoneVerifyView(),
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
    LoginWithMobile()
}
