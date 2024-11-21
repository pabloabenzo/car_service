//
//  InviteFriendsView.swift
//  QueerGOUser
//
//  Created by Pablo Benzo on 03/10/2024.
//

import SwiftUI

@available(iOS 17.0, *)
struct InviteFriendsView: View {
    private var modelTop = ModelTop()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack{
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
                        
                        modelTop.textLabel("Invitar amigos", .custom("MonsterratRoman-Bold", size: 22), fontColor: "secondary")
                        
                        Image("amigos")
                            .resizable()
                            .frame(width: 42, height: 32)
                    }
                    .frame(width: modelTop.deviceWidth, alignment: .leading)
                    .padding(.leading, 20)
                    
                    modelTop.textLabel("Invita a tus amigos y viaja por menos", .custom("OpenSansRoman-SemiBold", size: 16), fontColor: "base_white")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, modelTop.deviceWidth / 7).padding(.bottom, modelTop.deviceHeight / 15)
                    
                    Image("Invitar_amigos")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: modelTop.deviceWidth / 1.1)
                        .padding(.bottom, modelTop.deviceHeight / 25)
                    
                    modelTop.textLabel("Cuando tus amigos se hayan registrado y realizado su promer viaje, obtendrás 3,00 € de descuento en tus próximos viajes.", .custom("OpenSansRoman-SemiBold", size: 16), fontColor: "neutrals800")
                        .multilineTextAlignment(.center)
                        .padding(.leading, 50).padding(.trailing, 50).padding(.bottom, 10)
                    
                    
                    Text("JHON 1228")
                        .multilineTextAlignment(.center)
                        .padding(.leading, 30).padding(.trailing, 30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 17)
                                .stroke(Color(modelTop.colorManager(color: "primary")), lineWidth:1))
                        .padding(.bottom, modelTop.deviceHeight / 20)
                    
                    
                    Button(action: {
                        //                    dismiss()
                    }) {
                        modelTop.textLabel("Invitar amigos", .custom("OpenSansRoman-Bold", size: 16), fontColor: "base_white")
                        
                    }
                    .lineLimit(1)
                    .frame(width: modelTop.deviceWidth / 1.1, height: 50)
                    .background(modelTop.colorManager(color: "primary"))
                    .cornerRadius(6)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .padding(.bottom, modelTop.deviceHeight / 30)
                    
                    Image("queergo_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: modelTop.deviceWidth / 4)
                }
                .padding(.bottom, modelTop.deviceHeight / 100)
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

@available(iOS 17.0, *)
#Preview {
    InviteFriendsView()
}
