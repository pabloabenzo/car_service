//
//  ProfileView.swift
//  QueerGOUser
//
//  Created by Pablo Benzo on 03/09/2024.
//

import SwiftUI

@available(iOS 17.0, *)
struct ProfileView: View {
    
    var modelTop = ModelTop()
    @Environment(\.dismiss) var dismiss
    
    @State private var isNavigating = false
    @State private var isLoading = false
    @State private var isNavigating1 = false
    @State private var isLoading1 = false
    @State private var isNavigating2 = false
    @State private var isLoading2 = false
    @State private var isNavigating3 = false
    @State private var isLoading3 = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    Image("header_view")
                        .resizable()
                        .frame(width: modelTop.deviceWidth, height: modelTop.deviceHeight / 3.2)
                        .padding(.bottom, 950)
                    
                    VStack {
                        VStack {
                            Image("logo_header")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: modelTop.deviceWidth / 2, height: modelTop.deviceHeight / 5)
                        }
                        
                        modelTop.textLabel("Jhon Doe", .system(size: 20).bold(), fontColor: "base_black")
                            .frame(width: 350, alignment: .leading)
                            .padding(.leading, 20)
                        
                        modelTop.textLabel("jhondoe@gmail.com", .system(size: 16).bold(), fontColor: "primary")
                            .frame(width: 350, alignment: .leading)
                            .padding(.bottom, 50).padding(.leading, 20)
                        
                        HStack {
                            
                            HStack {
                                ZStack {
                                    Rectangle()
                                        .cornerRadius(16)
                                        .foregroundColor(modelTop.colorManager(color: "base_white"))
                                        .frame(width: modelTop.deviceWidth / 2.2, height: modelTop.deviceHeight / 8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(Color(modelTop.colorManager(color: "neutrals300")), lineWidth:3))
                                    
                                    VStack {
                                        Image("rutas")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.trailing, 110)
                                        modelTop.textLabel("Actividad", .system(size: 20), fontColor: "base_black")
                                            .padding(.trailing, 60).padding(.top, 5)
                                    }
                                }
                            }
                            
                            HStack {
                                
                                ZStack {
                                    Rectangle()
                                        .cornerRadius(16)
                                        .foregroundColor(modelTop.colorManager(color: "base_white"))
                                        .frame(width: modelTop.deviceWidth / 2.2, height: modelTop.deviceHeight / 8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(Color(modelTop.colorManager(color: "neutrals300")), lineWidth:3))
                                    
                                    VStack {
                                        Image("queer_point")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.trailing, 110)
                                        modelTop.textLabel("Queer Point", .system(size: 20), fontColor: "base_black")
                                            .padding(.trailing, 30).padding(.top, 5)
                                    }
                                }
                            }
                        }
                        
                        ZStack {
                            Rectangle()
                                .frame(height: 100)
                                .foregroundColor(modelTop.colorManager(color: "base_white"))
                            
                            List {
                                
                                ZStack {
                                    
                                    Button(action: loadAndNavigate) {
                                        
                                        Rectangle()
                                            .frame(width: modelTop.deviceWidth, height: 60)
                                            .foregroundColor(modelTop.colorManager(color: "base_white"))
//                                            .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                    }
                                    HStack {
                                        
                                        Image("usuario")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.trailing, 5)
                                        
                                        modelTop.textLabel("Mi cuenta             ", .system(size: 18), fontColor: "base_black")
                                            .padding(.trailing, 45).padding(.top, 5)
                                            .listRowBackground(modelTop.colorManager(color: "base_white"))
                                        
                                        Image("vector")
                                            .resizable()
                                            .frame(width: 8, height: 10)
                                            .padding(.leading, 100)
                                    }
                                    
                                }
                                .frame(height: 50)
                                .listRowSeparator(.hidden)
                                
                                ZStack {
                                    
                                    Button(action: loadAndNavigate1) {
                                        
                                        Rectangle()
                                            .frame(width: modelTop.deviceWidth, height: 60)
                                            .foregroundColor(modelTop.colorManager(color: "base_white"))
                                            .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                    }
                                    HStack {
                                        
                                        Image("dinero")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.trailing, 5)
                                        
                                        modelTop.textLabel("Métodos de pago", .system(size: 18), fontColor: "base_black")
                                            .padding(.trailing, 45).padding(.top, 5)
                                        
                                        Image("vector")
                                            .resizable()
                                            .frame(width: 8, height: 10)
                                            .padding(.leading, 100)
                                    }
                                    
                                }
                                .frame(height: 50)
                                .listRowSeparator(.hidden)
                                
                                ZStack {
                                    Button(action: loadAndNavigate2) {
                                        
                                        Rectangle()
                                            .frame(width: modelTop.deviceWidth, height: 60)
                                            .foregroundColor(modelTop.colorManager(color: "base_white"))
                                            .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                    }
                                    HStack {
                                        
                                        Image("amigos")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.trailing, 5)
                                        
                                        modelTop.textLabel("Invitar amigos", .system(size: 18), fontColor: "base_black")
                                            .padding(.trailing, 75).padding(.top, 5)
                                        
                                        Image("vector")
                                            .resizable()
                                            .frame(width: 8, height: 10)
                                            .padding(.leading, 100)
                                    }
                                    
                                }
                                .frame(height: 50)
                                .listRowSeparator(.hidden)
                                
                                ZStack {
                                    
                                    Button(action: loadAndNavigate3) {
                                        
                                        Rectangle()
                                            .frame(width: modelTop.deviceWidth, height: 60)
                                            .foregroundColor(modelTop.colorManager(color: "base_white"))
                                            .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                    }
                                    
                                    HStack {
                                        
                                        Image("descuento")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.trailing, 5)
                                        
                                        modelTop.textLabel("Códigos descuento", .system(size: 18), fontColor: "base_black")
                                            .padding(.trailing, 25).padding(.top, 5)
                                        
                                        Image("vector")
                                            .resizable()
                                            .frame(width: 8, height: 10)
                                            .padding(.leading, 100)
                                    }
                                    .foregroundColor(modelTop.colorManager(color: "base_white"))
                                }
                                .frame(height: 50)
                                .listRowSeparator(.hidden)
                                
                                ZStack {
                                    
                                    Rectangle()
                                        .frame(width: modelTop.deviceWidth, height: 60)
                                        .foregroundColor(modelTop.colorManager(color: "base_white"))
                                        .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                    
                                    HStack {
                                        
                                        Image("llamada")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.trailing, 5)
                                        
                                        modelTop.textLabel("Ayuda", .system(size: 18), fontColor: "base_black")
                                            .padding(.trailing, 140).padding(.top, 5)
                                        
                                        Image("vector")
                                            .resizable()
                                            .frame(width: 8, height: 10)
                                            .padding(.leading, 100)
                                    }
                                    
                                }
                                .frame(height: 50)
                                .listRowSeparator(.hidden)
                                
                                ZStack {
                                    
                                    Rectangle()
                                        .frame(width: modelTop.deviceWidth, height: 60)
                                        .foregroundColor(modelTop.colorManager(color: "base_white"))
                                        .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                    
                                    HStack {
                                        
                                        Image("altavoz")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.trailing, 5)
                                        
                                        modelTop.textLabel("Noticias", .system(size: 18), fontColor: "base_black")
                                            .padding(.trailing, 125).padding(.top, 5)
                                        
                                        Image("vector")
                                            .resizable()
                                            .frame(width: 8, height: 10)
                                            .padding(.leading, 100)
                                    }
                                    
                                }
                                .frame(height: 50)
                                .listRowSeparator(.hidden)
                                
                                ZStack {
                                    
                                    Rectangle()
                                        .frame(width: modelTop.deviceWidth, height: 60)
                                        .foregroundColor(modelTop.colorManager(color: "base_white"))
                                        .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                    
                                    HStack {
                                        
                                        Image("logo_morado")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.trailing, 5)
                                        
                                        modelTop.textLabel("Descarga Queergo Drivers", .system(size: 16), fontColor: "base_black")
                                            .padding(.top, 5)
                                        
                                        Image("vector")
                                            .resizable()
                                            .frame(width: 8, height: 10)
                                            .padding(.leading, 100)
                                    }
                                    
                                }
                                .frame(height: 50)
                                .listRowSeparator(.hidden)
                                
                            }
                            .listStyle(PlainListStyle())
                            .frame(height: 600)
                            .scrollDisabled(true)
                            
                        }
                        ZStack{
                            
                            Image("bottom_view")
                                .resizable()
                            
                            Image("logo_queergo")
                                .resizable()
                                .frame(width: 100, height: 120)
                            
                        }
                    }
                    if isLoading {
                        ZStack {
                            Color.gray.opacity(0.3)
                                .edgesIgnoringSafeArea(.all)
                            ProgressView("")
                                .progressViewStyle(CircularProgressViewStyle())
                            
                            NavigationLink(
                                destination: AccountView(),
                                isActive: $isNavigating
                            ) { }
                        }
                    } else if isLoading1 {
                        ZStack {
                            Color.gray.opacity(0.3)
                                .edgesIgnoringSafeArea(.all)
                            ProgressView("")
                                .progressViewStyle(CircularProgressViewStyle())
                            
                            NavigationLink(
                                destination: PaymentView(),
                                isActive: $isNavigating1
                            ) { }
                        }
                    } else if isLoading2 {
                        ZStack {
                            Color.gray.opacity(0.3)
                                .edgesIgnoringSafeArea(.all)
                            ProgressView("")
                                .progressViewStyle(CircularProgressViewStyle())
                            
                            NavigationLink(
                                destination: InviteFriendsView(),
                                isActive: $isNavigating2
                            ) { }
                        }
                    } else if isLoading3 {
                        ZStack {
                            Color.gray.opacity(0.3)
                                .edgesIgnoringSafeArea(.all)
                            ProgressView("")
                                .progressViewStyle(CircularProgressViewStyle())
                            
                            NavigationLink(
                                destination: DiscountCodeView(),
                                isActive: $isNavigating3
                            ) { }
                        }
                    }
                }
                .background(modelTop.colorManager(color: "base_white"))
            }
            .background(modelTop.colorManager(color: "secondary"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image("x_dismiss")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .padding(.leading, 0)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        //                        dismiss()
                    }) {
                        Image("plus_sign")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .padding(.leading, -20)
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
    
    private func loadAndNavigate1() {
        isLoading1 = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isLoading1 = false
            isNavigating1 = true
        }
    }
    
    private func loadAndNavigate2() {
        isLoading2 = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isLoading2 = false
            isNavigating2 = true
        }
    }
    
    private func loadAndNavigate3() {
        isLoading3 = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isLoading3 = false
            isNavigating3 = true
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    ProfileView()
}
