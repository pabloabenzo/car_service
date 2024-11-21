//
//  EmailVerifyView.swift
//  QueerGOUser
//
//  Created by Pablo Benzo on 06/08/2024.
//

import SwiftUI

@available(iOS 17.0, *)
struct EmailVerifyView: View {
    
    var modelTop = ModelTop()
    var signUpUserData = UserDataView()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("logo_relleno")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: modelTop.deviceHeight / 1.8)
                ZStack{
                    VStack {
                        
                        modelTop.textLabel("VERIFICA TU CORREO", .system(size: 45).bold(), fontColor: "primary")
                            .multilineTextAlignment(.center)
                            .frame(width: modelTop.deviceWidth / 1.2, height: 120)
                            .lineLimit(2)
                            .padding(.top, modelTop.deviceHeight / 50).padding(.bottom, modelTop.deviceHeight / 7)
                        
                        VStack {
                            modelTop.textLabel("Hemos enviado un correo a la siguiente dirección:", .system(size: 19), fontColor: "base_white")
                                .multilineTextAlignment(.center)
                                .frame(width: modelTop.deviceWidth / 1.2, height: 50)
                                .padding(.bottom, 10)
                            
                            TextField("", text: signUpUserData.$email, prompt: modelTop.textLabel("ejemplo@gmail.com", .system(size:20), fontColor: "base_white"))
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color(.baseWhite), lineWidth:3))
                                .padding(.bottom, 10).padding(.top, 10).padding(.leading, 70).padding(.trailing, 70)
                            
                            modelTop.textLabel("Comprueba tu correo y sigue las instrucciones de verificación", .system(size: 19), fontColor: "base_white")
                                .multilineTextAlignment(.center)
                                .frame(width: modelTop.deviceWidth / 1.2, height: 50, alignment: .center)
                                .lineLimit(2)
                                .padding(.bottom, modelTop.deviceHeight / 6)
                            
                        }
                        
                        if modelTop.isIphoneSE() == false {
                            
                            Image("queergo_logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: modelTop.deviceWidth / 4)
                            
                        } else {
                            Button {
                                // logica
                            } label: {
                                modelTop.textLabel("Siguiente", .system(size: 25).bold(), fontColor: "base_white")
                            }
                            .frame(width: modelTop.deviceWidth / 2, height: 50)
                            .background(modelTop.colorManager(color: "primary"))
                            .cornerRadius(6)
                            .shadow(color: .gray, radius: 2, x: 0, y: 2)
                            .padding(.bottom, 100)
                        }
                        
                        if modelTop.isIphoneSE() == false {
                            
                            Button {
                                // logica
                            } label: {
                                modelTop.textLabel("Siguiente", .custom("open sans", size: 18).bold(), fontColor: "base_white")
                            }
                            .frame(width: modelTop.deviceWidth / 2, height: 50)
                            .background(modelTop.colorManager(color: "primary"))
                            .cornerRadius(6)
                            .shadow(color: .gray, radius: 2, x: 0, y: 2)
                            .padding(.bottom, 20)
                            
                        }
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .padding()
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
}

@available(iOS 17.0, *)
#Preview {
    EmailVerifyView()
}
