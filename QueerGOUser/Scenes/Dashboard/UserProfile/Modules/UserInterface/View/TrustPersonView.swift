//
//  TrustPersonView.swift
//  QueerGOUser
//
//  Created by Pablo Benzo on 14/10/2024.
//

import SwiftUI

@available(iOS 17.0, *)
struct TrustPersonView: View {
    
    var modelTop = ModelTop()
    @Environment(\.dismiss) var dismiss
    @State var name: String = ""
    
    var body: some View {
        NavigationStack {
            
            VStack {
                HStack(spacing: 10) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image("purple_arrow")
                            .resizable()
                            .frame(width: 30, height: 25)
                    }
                    
                    modelTop.textLabel("Persona de confianza", .custom("MonsterratRoman-Bold", size: 18), fontColor: "base_black")
                    
                    Image("confianza")
                        .resizable()
                        .frame(width: 35, height: 32)
                        .padding(.trailing, 5)
                    
                    Button {
                        
                    } label: {
                        
                        modelTop.textLabel("Guardar", .custom("OpenSansRoman-SemiBold", size: 13), fontColor: "neutrals500")
                    }
                    .frame(maxWidth: 90, maxHeight: 40)
                    .background(modelTop.colorManager(color: "neutrals200"))
                    .cornerRadius(6)
                    .padding(.leading, 5)
                }
                .frame(width: modelTop.deviceWidth, alignment: .leading)
                .padding(.leading, 20)
                
                Rectangle()
                    .foregroundColor(modelTop.colorManager(color: "primary"))
                    .frame(width: modelTop.deviceWidth, height: 5)
                
                TextField("", text: $name, prompt: Text("Persona de confianza").foregroundColor(modelTop.colorManager(color: "base_black")))
                    .keyboardType(.default)
                    .font(.custom("OpenSansRoman-SemiBold", size: 14))
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color(modelTop.colorManager(color: "primary")), lineWidth:3))
                    .frame(maxWidth: .infinity)
                    .padding(.top, 20).padding(.trailing, 20).padding(.leading, 20)
                
                HStack {
                    HStack {
                        TextField("", text: $name, prompt:
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
                            .stroke(Color( modelTop.colorManager(color: "primary")), lineWidth:3)).frame(width: 120)
                        .padding(.bottom, 20).padding(.top, 20).padding(.leading, 20).padding(.trailing, 10)
                    
                    TextField("", text: $name, prompt: Text("Número de teléfono").foregroundColor( modelTop.colorManager(color: "base_black")))
                        .keyboardType(.numberPad)
                        .font(.custom("open sans", size: 16))
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color( modelTop.colorManager(color: "primary")), lineWidth:3))
                        .padding(.bottom, 20).padding(.top, 20).padding(.trailing, 20)
                }
                
                TextField("", text: $name, prompt: Text("Correo electrónico").foregroundColor(modelTop.colorManager(color: "base_black")))
                    .keyboardType(.default)
                    .font(.custom("OpenSansRoman-SemiBold", size: 14))
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color(modelTop.colorManager(color: "primary")), lineWidth:3))
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, modelTop.deviceHeight / 15).padding(.trailing, 20).padding(.leading, 20)
                
                Button {
                    
                } label: {
                    
                    modelTop.textLabel("Eliminar Cuenta", .custom("OpenSansRoman-SemiBold", size: 18), fontColor: "base_white")
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(modelTop.colorManager(color: "error100"))
                .cornerRadius(6)
                .padding(.top, modelTop.deviceHeight / 15).padding(.bottom, modelTop.deviceHeight / 15).padding(.trailing, 20).padding(.leading, 20)
                
                Rectangle()
                    .foregroundColor(modelTop.colorManager(color: "primary"))
                    .frame(width: modelTop.deviceWidth, height: 5)
                    .padding(.top, modelTop.deviceHeight / 15)
                
                Image("queergo_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: modelTop.deviceWidth / 4)
                    .padding(.top, 10)
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    TrustPersonView()
}
