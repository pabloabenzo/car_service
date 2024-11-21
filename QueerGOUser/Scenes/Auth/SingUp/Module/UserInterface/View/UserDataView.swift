//
//  UserDataView.swift
//  QueerGOUser
//
//  Created by Pablo Benzo on 07/08/2024.
//

import SwiftUI

@available(iOS 17.0, *)
struct UserDataView: View {
    
    var modelTop = ModelTop()
    var signUpInteractor = SignUpInteractor()
    
    @Environment(\.dismiss) var dismiss
    
    var urlLogin =  "https://api.queergo.com/api/user/login"
    var urlLogout = "https://api.queergo.com/api/user/logout"
    
    @State var name: String = ""
    @State var secondName: String = ""
    @State var dni: String = ""
    @State var email: String = ""
    
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
                        
                        modelTop.textLabel("Introduce tus datos personales", .custom("OpenSansRoman-Bold", size: 20), fontColor: "base_black")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(1)
                            .padding(.top, modelTop.deviceHeight / 50).padding(.leading, modelTop.deviceWidth / 15)
                        
                        modelTop.textLabel("Los necesitamos para que cada viaje sea seguro", .custom("OpenSansRoman-SemiBold", size: 14), fontColor: "primary")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, modelTop.deviceWidth / 15)
                    }
                    
                    VStack {
                        
                        TextField("", text: $name, prompt: Text("Nombre").foregroundColor(modelTop.colorManager(color: "base_black")))
                            .keyboardType(.default)
                            .font(.custom("OpenSansRoman-SemiBold", size: 14))
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color(modelTop.colorManager(color: "primary")), lineWidth:3))
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 0)
                        
                        TextField("", text: $secondName, prompt: Text("Apellidos").foregroundColor(modelTop.colorManager(color: "base_black")))
                            .keyboardType(.default)
                            .font(.custom("OpenSansRoman-SemiBold", size: 14))
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color(modelTop.colorManager(color: "primary")), lineWidth:3))
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 0).padding(.top, 20)
                        
                        TextField("", text: $secondName, prompt: Text("Email").foregroundColor(modelTop.colorManager(color: "base_black")))
                            .keyboardType(.default)
                            .font(.custom("OpenSansRoman-SemiBold", size: 14))
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color(modelTop.colorManager(color: "primary")), lineWidth:3))
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, modelTop.deviceHeight / 7).padding(.top, 20)
                    }
                    .padding()
                    
                    VStack {
                        Image("queergo_logo_white")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, maxHeight: modelTop.deviceHeight / 6)
                        
                        VStack {
                            Text("Al continuar, aceptas la ")
                                .font(.custom("OpenSansRoman-SemiBold", size: 14))
                                .foregroundColor(modelTop.colorManager(color: "base_white"))
                            + Text("Politica de privacidad y los Términos de uso ")
                                .font(.custom("OpenSansRoman-SemiBold", size: 14))
                                .foregroundColor(modelTop.colorManager(color: "secondary"))
                            + Text("de Queergo.")
                                .font(.custom("OpenSansRoman-SemiBold", size: 14))
                                .foregroundColor(modelTop.colorManager(color: "base_white"))
                        }
                        .frame(width: modelTop.deviceWidth / 1.2, height: 80)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .padding(.leading, 10)
                        
                        
                        Button(action: loadAndNavigate) {
                            
                            modelTop.textLabel("Siguiente", .custom("OpenSansRoman-SemiBold", size: 18), fontColor: "primary")
                        }
                        .frame(width: modelTop.deviceWidth / 2, height: 50)
                        .background(modelTop.colorManager(color: "base_white"))
                        .cornerRadius(6)
                    }
                    .padding(.bottom, modelTop.deviceHeight / 100)
                }
                
                if isLoading {
                    ZStack {
                        Color.gray.opacity(0.3)
                            .edgesIgnoringSafeArea(.all)
                        ProgressView("")
                            .progressViewStyle(CircularProgressViewStyle())
                        
                        NavigationLink(
                            destination: CreatePassword(),
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
    UserDataView()
}
