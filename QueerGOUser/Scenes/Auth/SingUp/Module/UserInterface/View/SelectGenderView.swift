//
//  SelectGenderView.swift
//  QueerGOUser
//
//  Created by Pablo Benzo on 25/09/2024.
//

import SwiftUI

@available(iOS 17.0, *)
struct SelectGenderView: View {
    
    var modelTop = ModelTop()
    @Environment(\.dismiss) var dismiss
    
    @State private var isNavigating = false
    @State private var isLoading = false
    
    @State private var isTapped = false
    @State private var isTapped2 = false
    @State private var isTapped3 = false
    @State private var isTapped4 = false
    @State private var isTapped5 = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .foregroundColor(modelTop.colorManager(color: "secondary"))
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack {
                        VStack {
                            
                            modelTop.textLabel("Elige el género y tu pronombre", .custom("MonsterratRoman-Bold", size: 22), fontColor: "base_black")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, modelTop.deviceHeight / 30).padding(.leading, modelTop.deviceWidth / 15)
                            
                            modelTop.textLabel("Para sentirte más agusto en los viajes.", .custom("OpenSansRoman-SemiBold", size: 16), fontColor: "primary")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 30).padding(.leading, modelTop.deviceWidth / 15)
                            
                            modelTop.textLabel("GÉNERO", .custom("OpenSansRoman-Bold", size: 24), fontColor: "primary")
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.bottom, 30)
                            
                            Image("Genero_logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: modelTop.deviceWidth / 1.5)
                            
                            modelTop.textLabel("PRONOMBRE", .custom("OpenSansRoman-Bold", size: 24), fontColor: "primary")
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                            VStack {
                                HStack(spacing: 20) {
                                    Button(action: {
                                        isTapped.toggle()
                                    }) {
                                        modelTop.textLabel("Él/Él/ Su o Suyo", .custom("OpenSans-Regular", size: 14), fontColor: "neutrals400")
                                    }
                                    .frame(width: 170, height: 25)
                                    .padding(5)
                                    .background(isTapped ? modelTop.colorManager(color: "primary") : modelTop.colorManager(color: "base_white"))
                                    .cornerRadius(27)
                                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                                    
                                    Button(action: {
                                        isTapped2.toggle()
                                    }) {
                                        modelTop.textLabel("Ellal/Ella/ Su o Suya", .custom("OpenSans-Regular", size: 14), fontColor: "neutrals400")
                                    }
                                    .frame(width: 170, height: 25)
                                    .padding(5)
                                    .background(isTapped2 ? modelTop.colorManager(color: "base_white") : modelTop.colorManager(color: "primary"))
                                    .cornerRadius(27)
                                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                                }
                                .padding(.bottom, modelTop.deviceHeight / 30)
                                
                                HStack(spacing: 20) {
                                    Button(action: {
                                        isTapped3.toggle()
                                    }) {
                                        modelTop.textLabel("Ella/Ella/ Su o Suya", .custom("OpenSans-Regular", size: 14), fontColor: "neutrals400")
                                    }
                                    .frame(width: 170, height: 25)
                                    .padding(5)
                                    .background(isTapped3 ? modelTop.colorManager(color: "primary") : modelTop.colorManager(color: "base_white"))
                                    .cornerRadius(27)
                                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                                    
                                    Button(action: {
                                        isTapped4.toggle()
                                    }) {
                                        modelTop.textLabel("Usar solo mi nombre", .custom("OpenSans-Regular", size: 14), fontColor: "neutrals400")
                                    }
                                    .frame(width: 170, height: 25)
                                    .padding(5)
                                    .background(isTapped4 ? modelTop.colorManager(color: "primary") : modelTop.colorManager(color: "base_white"))
                                    .cornerRadius(27)
                                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                                }
                                .padding(.bottom, modelTop.deviceHeight / 30)
                                
                                HStack {
                                    Button(action: {
                                        isTapped5.toggle()
                                    }) {
                                        modelTop.textLabel("Siguiente", .custom("OpenSans-Regular", size: 14), fontColor: "neutrals400")
                                    }
                                    .frame(width: 170, height: 25)
                                    .padding(5)
                                    .background(isTapped5 ? modelTop.colorManager(color: "primary") : modelTop.colorManager(color: "base_white"))
                                    .cornerRadius(27)
                                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                                }
                            }
                            .padding(.bottom, 50)
                            
                            Image("queergo_logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: modelTop.deviceWidth / 4)
                            
                            Button(action: loadAndNavigate) {
                                
                                modelTop.textLabel("Siguiente", .custom("OpenSansRoman-Bold", size: 16), fontColor: "base_white")
                            }
                            .frame(width: 225, height: 40)
                            .padding(5)
                            .background(modelTop.colorManager(color: "primary"))
                            .cornerRadius(6)
                            .shadow(color: .gray, radius: 2, x: 0, y: 2)
                            .padding(.bottom, 10)
                            
                        }
                        //                    .frame(width: modelTop.deviceWidth, height: modelTop.deviceHeight / 8, alignment: .leading)
                        //                    .padding(.bottom, modelTop.deviceHeight / -50)
                    }
                    if isLoading {
                        ZStack {
                            Color.gray.opacity(0.3)
                                .edgesIgnoringSafeArea(.all)
                            ProgressView("")
                                .progressViewStyle(CircularProgressViewStyle())
                            
                            NavigationLink(
                                destination: HomeView(),
                                isActive: $isNavigating
                            ) { }
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
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
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        //                        dismiss()
                    }) {
                        Image("Info_button")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .padding(.leading, -20)
                    }
                }
            }
            .padding(.top, -modelTop.deviceHeight / 30)
        }
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
    SelectGenderView()
}
