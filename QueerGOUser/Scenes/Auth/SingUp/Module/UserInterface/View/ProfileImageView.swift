//
//  ProfileImageView.swift
//  QueerGOUser
//
//  Created by Pablo Benzo on 06/08/2024.
//

import SwiftUI

@available(iOS 17.0, *)
struct ProfileImageView: View {
    
    var modelTop = ModelTop()
    @StateObject var signUpInteractor = SignUpInteractor()
    
    @Environment(\.dismiss) var dismiss
    @State private var showAlert = false
    @State private var isModalPresented = false
    
    @State private var isNavigating = false
    @State private var isLoading = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .foregroundColor(modelTop.colorManager(color: "secondary"))
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack {
                        modelTop.textLabel("Elige una foto para tu perfil", .custom("MonsterratRoman-Bold", size: 22), fontColor: "base_black")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, modelTop.deviceHeight / 50).padding(.leading, modelTop.deviceWidth / 15)
                        
                        modelTop.textLabel("Así los conductores podrán identificarte", .custom("OpenSansRoman-SemiBold", size: 16), fontColor: "primary")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, -10).padding(.bottom, 10).padding(.leading, modelTop.deviceWidth / 15)
                    }
                    .frame(width: modelTop.deviceWidth, height: modelTop.deviceHeight / 8, alignment: .leading)
                    .padding(.bottom, modelTop.deviceHeight / -50)
                    
                    ZStack {
                        Image("q_view")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: modelTop.deviceWidth / 1.2)
                            .padding(.bottom, modelTop.deviceHeight / -10)
                        
                        Button(action: {
                            isModalPresented = true
                        }) {
                            if let uiImage = signUpInteractor.loadImage() {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(.circle)
                                    .frame(width: modelTop.deviceWidth / 1.1)
                                    .padding(.bottom, modelTop.deviceHeight / -35).padding(.trailing, 10)
                            } else {
                                signUpInteractor.image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(.circle)
                                    .frame(width: modelTop.deviceWidth / 1.6)
                                    .padding(.bottom, modelTop.deviceHeight / -35).padding(.trailing, 15)
                            }
                        }
                    }
                    
                    if modelTop.isIphoneSE() == false {
                        
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
                        
                    } else {
                        
                        Image("queergo_logo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: modelTop.deviceWidth / 4)
                        
                        Button(action: loadAndNavigate) {
                            
                            modelTop.textLabel("Siguiente", .custom("OpenSansRoman-Bold", size: 16), fontColor: "base_white")
                        }
                        .frame(width: modelTop.deviceWidth / 2, height: 50)
                        .background(modelTop.colorManager(color: "primary"))
                        .cornerRadius(6)
                        .padding(.bottom, 100)
                    }
                    
                }
                .sheet(isPresented: $isModalPresented) {
                    AvatarModalView()
                }
                
                if isLoading {
                    ZStack {
                        Color.gray.opacity(0.3)
                            .edgesIgnoringSafeArea(.all)
                        ProgressView("")
                            .progressViewStyle(CircularProgressViewStyle())
                        
                        NavigationLink(
                            destination: SelectGenderView(),
                            isActive: $isNavigating
                        ) { }
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
        .navigationBarBackButtonHidden(true)
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
    ProfileImageView()
}
