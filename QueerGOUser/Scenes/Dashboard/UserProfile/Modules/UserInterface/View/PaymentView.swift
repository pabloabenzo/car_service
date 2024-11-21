//
//  PaymentView.swift
//  QueerGOUser
//
//  Created by Pablo Benzo on 04/10/2024.
//

import SwiftUI

@available(iOS 17.0, *)
struct PaymentView: View {
    private var modelTop = ModelTop()
    @Environment(\.dismiss) var dismiss
    
    @State private var isOn = false
    @State private var isOn2 = false
    @State private var isOn3 = false
    @State private var isOn4 = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .foregroundColor(modelTop.colorManager(color: "primary"))
                    .edgesIgnoringSafeArea(.top)
                    .frame(width: modelTop.deviceWidth, height: 150)
                    .padding(.bottom, modelTop.deviceHeight)
                
                Image("Ellipse_1")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, modelTop.deviceHeight / 1.35)
                
                VStack {
                    HStack(spacing: 10) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image("yellow_arrow")
                                .resizable()
                                .frame(width: 30, height: 25)
                        }
                        
                        modelTop.textLabel("Métodos de pago", .custom("MonsterratRoman-Bold", size: 22), fontColor: "secondary")
                        
                        Image("dinero")
                            .resizable()
                            .frame(width: 42, height: 32)
                    }
                    .frame(width: modelTop.deviceWidth, alignment: .leading)
                    .padding(.leading, 20)
                    
                    modelTop.textLabel("Elige como quieres pagar", .custom("OpenSansRoman-SemiBold", size: 16), fontColor: "base_white")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, modelTop.deviceWidth / 7).padding(.bottom, modelTop.deviceHeight / 15)
                    
                    List {
                        ZStack {
                            
                            Rectangle()
                                .frame(width: modelTop.deviceWidth, height: 60)
                                .foregroundColor(modelTop.colorManager(color: "base_white"))
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                            
                            HStack(alignment: .center, spacing: 10) {
                                
                                Image("intimidad")
                                    .resizable()
                                    .frame(width: 35, height: 32)
                                    .padding(.trailing, 5)
                                
                                VStack {
                                    
                                    modelTop.textLabel("Mis datos", .system(size: 14), fontColor: "primary").bold()
                                        .padding(.trailing, 105)
                                    
                                    modelTop.textLabel("Edita mail, contraseña...", .system(size: 14), fontColor: "neutrals400").bold()
                                        .padding(.trailing, 10)
                                }
                                
                                
                                
                            }
                            .frame(width: modelTop.deviceWidth, alignment: .leading)
                            .padding(.leading, 30)
                            
                            Toggle(isOn: $isOn) {
                                Text("")
                            }
                            .tint(modelTop.colorManager(color: "primary"))
                            .padding(.trailing, 30)
                            
                        }
                        .frame(height: 50)
                        .listRowSeparator(.hidden)
                        
                        ZStack {
                            
                            Rectangle()
                                .frame(width: modelTop.deviceWidth, height: 60)
                                .foregroundColor(modelTop.colorManager(color: "base_white"))
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                            
                            HStack(alignment: .center, spacing: 10) {
                                
                                Image("confianza")
                                    .resizable()
                                    .frame(width: 35, height: 32)
                                    .padding(.trailing, 5)
                                
                                VStack {
                                    
                                    modelTop.textLabel("Persona de confianza", .system(size: 14), fontColor: "primary").bold()
                                        .padding(.trailing, 75).padding(.top, 5)
                                    
                                    modelTop.textLabel("Comparte todos tus viajes", .system(size: 14), fontColor: "neutrals400").bold()
                                        .padding(.trailing, 45)
                                }
                                
                            }
                            .frame(width: modelTop.deviceWidth, alignment: .leading)
                            .padding(.leading, 30)
                            
                            Toggle(isOn: $isOn2) {
                                Text("")
                            }
                            .tint(modelTop.colorManager(color: "primary"))
                            .padding(.trailing, 30)
                            
                        }
                        .frame(height: 50)
                        .listRowSeparator(.hidden)
                        
                        ZStack {
                            
                            Rectangle()
                                .frame(width: modelTop.deviceWidth, height: 60)
                                .foregroundColor(modelTop.colorManager(color: "base_white"))
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                            
                            HStack(alignment: .center, spacing: 10) {
                                
                                Image("accesibilidad")
                                    .resizable()
                                    .frame(width: 35, height: 32)
                                    .padding(.trailing, 5)
                                
                                VStack {
                                    
                                    modelTop.textLabel("Accesibilidad de viaje", .system(size: 14), fontColor: "primary").bold()
                                        .padding(.trailing, 75).padding(.top, 5)
                                    
                                    modelTop.textLabel("Comparte todos tus viajes", .system(size: 14), fontColor: "neutrals400").bold()
                                        .padding(.trailing, 45)
                                }
                                
                            }
                            .frame(width: modelTop.deviceWidth, alignment: .leading)
                            .padding(.leading, 30)
                            
                            Toggle(isOn: $isOn3) {
                                Text("")
                            }
                            .tint(modelTop.colorManager(color: "primary"))
                            .padding(.trailing, 30)
                            
                        }
                        .frame(height: 50)
                        .listRowSeparator(.hidden)
                        
                        ZStack {
                            
                            Rectangle()
                                .frame(width: modelTop.deviceWidth, height: 60)
                                .foregroundColor(modelTop.colorManager(color: "base_white"))
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                            
                            HStack(alignment: .center, spacing: 10) {
                                
                                Image("mapa_contacto")
                                    .resizable()
                                    .frame(width: 35, height: 32)
                                    .padding(.trailing, 5)
                                
                                VStack {
                                    
                                    modelTop.textLabel("Mis lugares", .system(size: 14), fontColor: "primary").bold()
                                        .padding(.trailing, 158).padding(.top, 5)
                                    
                                    modelTop.textLabel("Guarda tus lugares favoritos", .system(size: 14), fontColor: "neutrals400").bold()
                                        .padding(.trailing, 45)
                                }
                                
                            }
                            .frame(width: modelTop.deviceWidth, alignment: .leading)
                            .padding(.leading, 30)
                            
                            Toggle(isOn: $isOn4) {
                                Text("")
                            }
                            .tint(modelTop.colorManager(color: "primary"))
                            .padding(.trailing, 30)
                            
                        }
                        .frame(height: 50)
                        .listRowSeparator(.hidden)
                        .padding(.bottom,  modelTop.deviceHeight / 10)
                        
                        List {
                            ZStack {
                                
                                Rectangle()
                                    .frame(width: modelTop.deviceWidth, height: 60)
                                    .foregroundColor(modelTop.colorManager(color: "neutrals200"))
                                    .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                
                                HStack(alignment: .center, spacing: 10) {
                                    
                                    Image("signo_mas")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .padding(.trailing, 5)
                                    
                                    VStack {
                                        
                                        modelTop.textLabel("Añadir Método de pago", .system(size: 14), fontColor: "base_black").bold()
                                            .padding(.trailing, 105)
                                    }
                                    
                                    
                                    
                                }
                                .frame(width: modelTop.deviceWidth, alignment: .leading)
                                .padding(.leading, 30)
                                
                            }
                            .frame(height: 50)
                            .listRowSeparator(.hidden)
                            
                        }
                        .frame(width: modelTop.deviceWidth)
                        .padding(.top, -modelTop.deviceHeight / 20)
                        
                    }
                    .listStyle(PlainListStyle())
                    .frame(height: modelTop.deviceHeight / 2)
                    .scrollDisabled(true)
                    .padding(.top, 30).padding(.bottom, -50)
                    
                    Image("logo_queergo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: modelTop.deviceWidth / 3.5)
                        .padding(.top, modelTop.deviceHeight / 10)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

@available(iOS 17.0, *)
#Preview {
    PaymentView()
}
