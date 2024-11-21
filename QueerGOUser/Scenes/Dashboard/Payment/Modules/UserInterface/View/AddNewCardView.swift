//
//  AddNewCardView.swift
//  QueerGOUser
//
//  Created by Pablo Benzo on 10/10/2024.
//

import SwiftUI

@available(iOS 17.0, *)
struct AddNewCardView: View {
    
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
                            
                            modelTop.textLabel("Añadir tarjeta", .custom("MonsterratRoman-Bold", size: 22), fontColor: "base_black")
                            
                            Image("credit_card")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 32)
                        }
                        .frame(width: modelTop.deviceWidth, alignment: .leading)
                        .padding(.leading, 20)
                        
                        Rectangle()
                            .foregroundColor(modelTop.colorManager(color: "primary"))
                            .frame(width: modelTop.deviceWidth, height: 5)
                        
                        Image("chica_tarjeta")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: modelTop.deviceWidth / 1.1)
                            .padding(.bottom, modelTop.deviceHeight / 25)
                        
                        VStack {
                            
                            TextField("", text: $name, prompt: Text("Número de Tarjeta").foregroundColor(modelTop.colorManager(color: "base_black")))
                                .keyboardType(.default)
                                .font(.custom("OpenSansRoman-SemiBold", size: 14))
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color(modelTop.colorManager(color: "primary")), lineWidth:3))
                                .frame(maxWidth: .infinity)
                                .padding(.bottom, 0).padding(.top, 20).padding(.trailing, 20).padding(.leading, 20)
                            
                            HStack {
                                HStack {
                                    
                                    TextField("", text: $name, prompt:
                                                Text("Caducidad").foregroundColor( modelTop.colorManager(color: "base_black")))
                                    .keyboardType(.numberPad)
                                    .font(.custom("open sans", size: 16))
                                    .padding(.trailing, 20).padding(.leading, 20)

                                }
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color( modelTop.colorManager(color: "primary")), lineWidth:3)).frame(width: 220)
                                    .padding(.trailing, 20).padding(.leading, 20)
                                
                                TextField("", text: $name, prompt: Text("CVV").foregroundColor( modelTop.colorManager(color: "base_black")))
                                    .keyboardType(.numberPad)
                                    .font(.custom("open sans", size: 16))
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color( modelTop.colorManager(color: "primary")), lineWidth:3))
                                    .padding(.bottom, 20).padding(.top, 20).padding(.trailing, 20)
                            }
                            .padding(.bottom, modelTop.deviceHeight / 20)
                            
                                Text("Tu información de pago se guardará de forma segura")
                                    .font(.custom("OpenSansRoman-SemiBold", size: 14))
                                    .foregroundColor(modelTop.colorManager(color: "neutrals200"))
                            
                            Button {
                                
                            } label: {
                                
                                modelTop.textLabel("Guardar", .custom("OpenSansRoman-SemiBold", size: 18), fontColor: "neutrals500")
                            }
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(modelTop.colorManager(color: "neutrals200"))
                            .cornerRadius(6)
                            .padding()
                            
                            Rectangle()
                                .foregroundColor(modelTop.colorManager(color: "primary"))
                                .frame(width: modelTop.deviceWidth, height: 5)
                            
                            Image("queergo_logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: modelTop.deviceWidth / 4)
                                .padding(.bottom, 5).padding(.top, 15)
                            
                        }
                    }
                
            }
        }
    }


@available(iOS 17.0, *)
#Preview {
    AddNewCardView()
}
