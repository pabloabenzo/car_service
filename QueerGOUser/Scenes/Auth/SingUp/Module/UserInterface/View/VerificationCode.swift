//
//  VerificationCode.swift
//  QueerGOUser
//
//  Created by Pablo Benzo on 20/08/2024.
//

import SwiftUI

@available(iOS 17.0, *)
struct VerificationCode: View {
    
    var modelTop = ModelTop()
    var signUpInteractor = SignUpInteractor()
    
    @Environment(\.dismiss) var dismiss
    
    @State var phone: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("purple_wall_q2")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .padding(.top, 10)
                VStack {
                    VStack {
                        
                        modelTop.textLabel("INTRODUCE EL CÓDIGO DE VERIFICACIÓN.", .system(size: 20).bold(), fontColor: "base_black")
                            .frame(width: 350, alignment: .leading)
                            .padding(.top, modelTop.deviceHeight / 50).padding(.leading, modelTop.deviceWidth / 20)
                        
                        modelTop.textLabel("Te lo hemos enviado al correo: Jhondoe*******com", .system(size: 16).bold(), fontColor: "primary")
                            .frame(width: 350, alignment: .leading)
                            .padding(.top, 10).padding(.bottom, 20).padding(.leading, modelTop.deviceWidth / 20)
                        
                        
                        TextField("", text: $phone, prompt: Text("Introduce el código").foregroundColor(modelTop.colorManager(color: "base_black")))
                            .keyboardType(.numberPad)
                            .font(.system(size: 16))
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color(.primary000), lineWidth:3))
                            .padding(.leading, modelTop.deviceWidth / 10).padding(.trailing, modelTop.deviceWidth / 10)
                        
                    }
                    .padding(.top, modelTop.deviceHeight / 100)
                    
                    VStack {
                        Image("queergo_logo_white")
                            .resizable()
                            .scaledToFit()
                            .padding(.top, modelTop.deviceHeight / 4.5).padding(.bottom, modelTop.deviceWidth / 4)
                        
                        Text("Podrás pedir un nuevo código en 9 seg")
                            .font(.system(size: 14))
                            .foregroundColor(.baseWhite)
                            .frame(width: 350, height: 80)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .padding(.top,-50).padding(.leading, 10)
                        
                        Button {
                            signUpInteractor.postSignIn()
                        } label: {
                            modelTop.textLabel("Siguiente", .custom("open sans", size: 18), fontColor: "primary")
                        }
                        .frame(width: modelTop.deviceWidth / 2, height: 50)
                        .background(modelTop.colorManager(color: "base_white"))
                        .cornerRadius(5)
                        .padding(.top, -20)
                        
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
    }
}

@available(iOS 17.0, *)
#Preview {
    VerificationCode()
}
