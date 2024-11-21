//
//  AvatarModalView.swift
//  QueerGOUser
//
//  Created by Pablo Benzo on 02/10/2024.
//

import SwiftUI
import PhotosUI

@available(iOS 17.0, *)
struct AvatarModalView: View {
    @StateObject var signUpInteractor = SignUpInteractor()
    
    var body: some View {
        
        let modelTop = ModelTop()
        @Environment(\.dismiss) var dismiss
        @State var didPicked = false
        @State var photoSelection: PhotosPickerItem?
        @StateObject var signUpInteractor = SignUpInteractor()
        
        NavigationStack {
            ZStack {
                Rectangle()
                    .foregroundColor( modelTop.colorManager(color: "base_white"))
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                VStack {
                    
                    modelTop.textLabel("Selecciona un Avatar", .custom("OpenSansRoman-Bold", size: 22), fontColor: "base_black")
                        .frame(width: 350, alignment: .leading)
                        .padding(.top, modelTop.deviceHeight / 50).padding(.leading, modelTop.deviceWidth / 25)
                    
                    modelTop.textLabel("O sube una foto desde tu dispositivo", .custom("OpenSansRoman-SemiBold", size: 14), fontColor: "primary")
                        .frame(width: 350, alignment: .leading)
                        .padding(.top, -15).padding(.bottom, 20).padding(.leading, modelTop.deviceWidth / 25)
                    
                    ScrollView {
                        VStack {
                            HStack(spacing: 25) {
                                Button(action: {
                                    
                                }) {
                                    Image("Avatar_lian")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: modelTop.deviceWidth / 4)
                                }
                                
                                Image("Avatar_lucy")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: modelTop.deviceWidth / 4)
                                
                                Image("Avatar_makena")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: modelTop.deviceWidth / 4)
                            }
                            .padding(.bottom, 20)
                            
                            HStack(spacing: 25) {
                                Image("Avatar_montse")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: modelTop.deviceWidth / 4)
                                
                                Image("Avatar_olivier")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: modelTop.deviceWidth / 4)
                                
                                Image("Avatar_patricia")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: modelTop.deviceWidth / 4)
                            }
                            .padding(.bottom, 20)
                            
                            HStack(spacing: 25) {
                                Image("Avatar_pedro")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: modelTop.deviceWidth / 4)
                                
                                Image("Avatar_rafa")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: modelTop.deviceWidth / 4)
                                
                                Image("Avatar_ronan")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: modelTop.deviceWidth / 4)
                            }
                            .padding(.bottom, 20)
                            
                            HStack(spacing: 25) {
                                Image("Avatar_sasha")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: modelTop.deviceWidth / 4)
                                
                                Image("Avatar_sofiane")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: modelTop.deviceWidth / 4)
                                
                                Image("Avatar_vanessa")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: modelTop.deviceWidth / 4)
                            }
                            .padding(.bottom, 20)
                            
                            HStack(spacing: 25) {
                                Image("Avatar_viktor")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: modelTop.deviceWidth / 4)
                                
                                Image("Avatar_zahra")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: modelTop.deviceWidth / 4)
                            }
                            .padding(.bottom, 20)
                        }
                    }
                    .scrollIndicators(.hidden)
                    .contentMargins(.bottom, 80)
                    
                    VStack {
                        ZStack {
                            Image("purple_line")
                                .frame(width: modelTop.deviceWidth, height: 4)
                            Image("purple_line")
                                .frame(width: modelTop.deviceWidth, height: 4)
                            
                            Image("Rectangle_8")
                                .foregroundColor(modelTop.colorManager(color: "secondary"))
                                .edgesIgnoringSafeArea(.top)
                                .frame(width: modelTop.deviceWidth, height: modelTop.deviceHeight / 3.2)
                            
                            VStack {
                                Button(action: {
                                    dismiss()
                                }) {
                                    
                                    modelTop.textLabel("Seleccionar", .custom("OpenSansRoman-Bold", size: 16), fontColor: "secondary")
                                    
                                }
                                .frame(width: modelTop.deviceWidth / 2, height: 50)
                                .background(modelTop.colorManager(color: "primary"))
                                .cornerRadius(6)
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                                .padding(.bottom, 10).padding(.top, -20)
                                
                                PhotosPicker(selection: $signUpInteractor.photoSelection, matching: .images, photoLibrary: .shared()) {
                                    
                                    modelTop.textLabel("Subir desde el dispositivo", .custom("OpenSansRoman-Bold", size: 16), fontColor: "primary")
                                    
                                }
                                .lineLimit(1)
                                .frame(width: modelTop.deviceWidth / 1.1, height: 50)
                                .background(modelTop.colorManager(color: "base_white"))
                                .cornerRadius(6)
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                                .padding(.bottom, 10)
                                //                        .onChange(of: photoSelection) { newImage in
                                //                            if let newImage = newImage {
                                //                                didPicked = true
                                //                            }
                                //                        }
                                Image("queergo_logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: modelTop.deviceWidth / 4)
                            }
                        }
                    }
                    .frame(height: modelTop.deviceHeight / 5.5)
                }
                .onAppear {
                    if didPicked == true {
                        dismiss()
                    }
                    didPicked = false
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
    AvatarModalView()
}
