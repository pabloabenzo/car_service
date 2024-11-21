//
//  AccessibilityView.swift
//  QueerGOUser
//
//  Created by Pablo Benzo on 14/10/2024.
//

import SwiftUI

@available(iOS 17.0, *)
struct AccessibilityView: View {
    
    var modelTop = ModelTop()
    @Environment(\.dismiss) var dismiss
    
    @State var name: String = ""
    @State private var isOn = false
    @State private var isOn2 = false
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Button(action: {
                    dismiss()
                }) {
                    Image("purple_arrow")
                        .resizable()
                        .frame(width: 30, height: 25)
                }
                
                modelTop.textLabel("Accesibilidad de viaje", .custom("MonsterratRoman-Bold", size: 22), fontColor: "base_black")
                
                Image("accesibilidad")
                    .resizable()
                    .frame(width: 35, height: 32)
                    .padding(.trailing, 5)
                
            }
            .frame(width: modelTop.deviceWidth, alignment: .leading)
            .padding(.leading, 20)
            
            Rectangle()
                .foregroundColor(modelTop.colorManager(color: "primary"))
                .frame(width: modelTop.deviceWidth, height: 5)
            
            modelTop.textLabel("Indica si tienes necesidades especiales", .custom("OpenSansRoman-SemiBold", size: 14), fontColor: "base_black")
                .frame(maxWidth: .infinity, alignment: .center)
            
            List {
                ZStack {
                    Rectangle()
                        .frame(width: modelTop.deviceWidth, height: 60)
                        .foregroundColor(modelTop.colorManager(color: "base_white"))
                        .shadow(color: .gray, radius: 2, x: 0, y: 3)
                    
                    HStack(alignment: .center, spacing: 10) {
                        
                        Image("")
                            .resizable()
                            .frame(width: 35, height: 32)
                            .padding(.trailing, 5)
                        
                        VStack(alignment: .leading) {
                            
                            modelTop.textLabel("Ayuda para subir abordo", .system(size: 14), fontColor: "primary").bold()
                                .padding(.trailing, 105)
                            
                            modelTop.textLabel("Si quieres que alguien te ayude", .system(size: 14), fontColor: "neutrals400").bold()
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
                        
                        Image("")
                            .resizable()
                            .frame(width: 35, height: 32)
                            .padding(.trailing, 5)
                        
                        VStack(alignment: .leading) {
                            
                            modelTop.textLabel("Chat en lugar de llamadas", .system(size: 14), fontColor: "primary").bold()
                                .padding(.trailing, 75).padding(.top, 5)
                            
                            modelTop.textLabel("La persona que conduce no te llamará", .system(size: 14), fontColor: "neutrals400").bold()
                                .padding(.trailing, 45)
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
                        
                        Image("")
                            .resizable()
                            .frame(width: 35, height: 32)
                            .padding(.trailing, 5)
                        
                        VStack(alignment: .leading) {
                            
                            modelTop.textLabel("Avisos importantes por voz", .system(size: 14), fontColor: "primary").bold()
                                .padding(.trailing, 75).padding(.top, 5)
                            
                            modelTop.textLabel("Escucharás avisos sobre tu viaje", .system(size: 14), fontColor: "neutrals400").bold()
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
            }
            .listStyle(PlainListStyle())
            .frame(height: modelTop.deviceHeight / 2)
            .scrollDisabled(true)
            .padding(.top, modelTop.deviceHeight / 10).padding(.bottom, modelTop.deviceHeight / 40)
            
            Rectangle()
                .foregroundColor(modelTop.colorManager(color: "primary"))
                .frame(width: modelTop.deviceWidth, height: 5)
            
            Image("queergo_logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: modelTop.deviceWidth / 4)
        }
        
            .padding(.bottom, 5).padding(.top, 15)
    }
}

@available(iOS 17.0, *)
#Preview {
    AccessibilityView()
}
