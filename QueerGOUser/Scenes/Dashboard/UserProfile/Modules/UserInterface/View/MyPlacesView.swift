//
//  MyPlacesView.swift
//  QueerGOUser
//
//  Created by Pablo Benzo on 14/10/2024.
//

import SwiftUI

@available(iOS 17.0, *)
struct MyPlacesView: View {
    
    var modelTop = ModelTop()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Button(action: {
                dismiss()
            }) {
                Image("purple_arrow")
                    .resizable()
                    .frame(width: 30, height: 25)
            }
            
            
            .frame(width: modelTop.deviceWidth, alignment: .leading)
            .padding(.leading, 20)
            
            Image("chica_lugares")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: modelTop.deviceWidth / 1.1)
            
            VStack(alignment: .leading) {
                HStack() {
                    modelTop.textLabel("Mis lugares", .custom("MonsterratRoman-Bold", size: 22), fontColor: "base_black")
                    
                    Image("mapa_contacto")
                        .resizable()
                        .frame(width: 35, height: 32)
                        .padding(.trailing, 5)
                }
                
                modelTop.textLabel("Añade tus direcciones y pide más rápido", .custom("OpenSansRoman-SemiBold", size: 14), fontColor: "base_black")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(width: modelTop.deviceWidth / 1.3)
            .padding(.leading, 20)
            
            Button {
                
            } label: {
                
                modelTop.textLabel("Añadir Lugar", .custom("OpenSansRoman-SemiBold", size: 18), fontColor: "base_white")
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(modelTop.colorManager(color: "primary"))
            .cornerRadius(6)
            .padding(.top, modelTop.deviceHeight / 10).padding(.bottom, modelTop.deviceHeight / 15).padding(.trailing, 20).padding(.leading, 20)
            
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

@available(iOS 17.0, *)
#Preview {
    MyPlacesView()
}
