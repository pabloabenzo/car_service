//
//  AccountView.swift
//  QueerGOUser
//
//  Created by Pablo Benzo on 09/09/2024.
//

import SwiftUI
import PhotosUI

@available(iOS 17.0, *)
struct AccountView: View {
    
    var modelTop = ModelTop()
    @StateObject var userInteractor = UserInteractor()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Image("account_wall")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: modelTop.deviceWidth, height: modelTop.deviceHeight / 2.8, alignment: .top)
                    .padding(.bottom, modelTop.deviceHeight / 1.5)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    HStack() {
                        Button(action: {
                            dismiss()
                        }) {
                            Image("arrow_button")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: modelTop.deviceWidth / 5)
                        }
                        .padding(.trailing, -20)
                        
                        modelTop.textLabel("Mi cuenta", .system(size: 20).bold(), fontColor: "secondary")
                            .frame(width: 100, alignment: .leading)
                        
                        Image("usuario")
                            .resizable()
                            .frame(width: 32, height: 32)
                        
                    }
                    .frame(width: modelTop.deviceWidth, alignment: .leading)
                    
                    
                    HStack {
                        VStack {
                            modelTop.textLabel("Hola Jhon", .system(size: 20).bold(), fontColor: "secondary")
                                .frame(width: 350, alignment: .leading)
                                .padding(.leading, 20).padding(.top, 50)
                            
                            modelTop.textLabel("Listos para viajar ¿y tú?", .system(size: 16).bold(), fontColor: "base_white")
                                .frame(width: 350, alignment: .leading)
                                .padding(.bottom, 50).padding(.leading, 20)
                        }
                        .padding(.trailing, -145)
                        
                        PhotosPicker(selection: $userInteractor.photoSelection, matching: .images, photoLibrary: .shared()) {
                            
                            if let uiImage = userInteractor.loadImage() {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(.circle)
                                    .frame(width: modelTop.deviceWidth / 2.5)
                            } else {
                                Image("add_photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: modelTop.deviceWidth / 2.5)
                            }
                        }
                        .padding(.bottom, modelTop.deviceHeight / -35).padding(.trailing, 15)
                    }
                    
                    List {
                        ZStack {
                            
                            Rectangle()
                                .frame(width: modelTop.deviceWidth, height: 60)
                                .foregroundColor(modelTop.colorManager(color: "neutrals200"))
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
                            
                            Image("vector")
                                .resizable()
                                .frame(width: 8, height: 10)
                                .padding(.leading, modelTop.deviceWidth / 1.1)
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
                            
                            Image("vector")
                                .resizable()
                                .frame(width: 8, height: 10)
                                .padding(.leading, modelTop.deviceWidth / 1.1)
                            
                        }
                        .frame(height: 50)
                        .listRowSeparator(.hidden)
                        
                        ZStack {
                            
                            Rectangle()
                                .frame(width: modelTop.deviceWidth, height: 60)
                                .foregroundColor(modelTop.colorManager(color: "neutrals200"))
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
                            
                            Image("vector")
                                .resizable()
                                .frame(width: 8, height: 10)
                                .padding(.leading, modelTop.deviceWidth / 1.1)
                            
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
                            
                            Image("vector")
                                .resizable()
                                .frame(width: 8, height: 10)
                                .padding(.leading, modelTop.deviceWidth / 1.1)
                            
                        }
                        .frame(height: 50)
                        .listRowSeparator(.hidden)
                        
                        ZStack {
                            
                            Rectangle()
                                .frame(width: modelTop.deviceWidth, height: 60)
                                .foregroundColor(modelTop.colorManager(color: "neutrals200"))
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                            
                            HStack(alignment: .center, spacing: 10) {
                                
                                Image("ajuste")
                                    .resizable()
                                    .frame(width: 35, height: 32)
                                    .padding(.trailing, 5)
                                
                                VStack {
                                    
                                    modelTop.textLabel("Mis preferencias", .system(size: 14), fontColor: "primary").bold()
                                        .padding(.trailing, 125).padding(.top, 5)
                                    
                                    modelTop.textLabel("Haz que tu viaje sea especial", .system(size: 14), fontColor: "neutrals400").bold()
                                        .padding(.trailing, 45)
                                }
                                
                            }
                            .frame(width: modelTop.deviceWidth, alignment: .leading)
                            .padding(.leading, 30)
                            
                            Image("vector")
                                .resizable()
                                .frame(width: 8, height: 10)
                                .padding(.leading, modelTop.deviceWidth / 1.1)
                            
                        }
                        .frame(height: 50)
                        .listRowSeparator(.hidden)
                        
                    }
                    .listStyle(PlainListStyle())
                    .frame(height: modelTop.deviceHeight / 2)
                    .scrollDisabled(true)
                    .padding(.top, 50).padding(.bottom, -50)
                    
                    
                    Image("logo_queergo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: modelTop.deviceWidth / 3.5)
                }
                
            }
            .background(modelTop.colorManager(color: "base_white"))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

@available(iOS 17.0, *)
#Preview {
    AccountView()
}
