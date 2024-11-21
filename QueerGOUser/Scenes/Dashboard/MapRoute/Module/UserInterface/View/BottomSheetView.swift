//
//  BottomSheetView.swift
//  QueerGOUser
//
//  Created by Pablo Benzo on 30/08/2024.
//

import SwiftUI

@available(iOS 17.0, *)
struct BottomSheetView: View {
    
    private let modelTop = ModelTop()
    @State var address: String = ""
    @State private var isTextFieldSheetPresented = false
    
    var body: some View {
        ZStack {
            Image("fondo_home")
                .resizable()
                .scaledToFill()
                .onTapGesture {
                    modelTop.hideKeyboard()
                }
            VStack {
                modelTop.textLabel("¡Hola, Jhon!", .system(size: 20).bold(), fontColor: "base_black")
                    .frame(width: 350, alignment: .leading)
                    .padding(.leading, 30).padding(.top, 180)
                
                modelTop.textLabel("Muévete con Queergo", .system(size: 18).bold(), fontColor: "primary")
                    .frame(width: 350, alignment: .leading)
                    .padding(.leading, 30)
                
                HStack{
                    Image("lupa")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25, height: 25)
                        .padding(.trailing, 10)
                    
                    TextField("", text: $address, prompt: Text("¿A dónde quieres ir?").foregroundColor(modelTop.colorManager(color: "primary")))
                        .onTapGesture {
                                // Presenta la hoja cuando el TextField es tocado
                                isTextFieldSheetPresented = true
                            }
                            .keyboardType(.default)
                            .font(.system(size: 16).bold())
                            .foregroundColor(modelTop.colorManager(color: "base_black"))
                            //                                        .sheet(isPresented: $isTextFieldSheetPresented) {
                            //                                            SignUpView()
                            //                                        }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color(modelTop.colorManager(color: "primary")), lineWidth: 5))
                .background(modelTop.colorManager(color: "base_white"))
                .cornerRadius(15, corners: .allCorners)
                .padding(.bottom, 5).padding(.top, 10).padding(.leading, 35).padding(.trailing, 45)
                
                HStack{
                    ZStack {
                        Rectangle()
                            .frame(width: 50, height: 50, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color(modelTop.colorManager(color: "base_white")), lineWidth: 1.5).background(modelTop.colorManager(color: "base_white")))
                            .cornerRadius(60)
                        Image("hogar")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                    }
                    .padding(.leading, -20)
                    
                    modelTop.textLabel("Añadir casa", .system(size: 18), fontColor: "base_black")
                        .frame(width: 250, alignment: .leading)
                    
                }
                
                HStack{
                    ZStack {
                        Rectangle()
                            .frame(width: 50, height: 50, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color(modelTop.colorManager(color: "base_white")), lineWidth: 1.5).background(modelTop.colorManager(color: "base_white")))
                            .cornerRadius(60)
                        Image("maleta")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                    }
                    .padding(.leading, -20)
                    
                    modelTop.textLabel("Añadir trabajo", .system(size: 18), fontColor: "base_black")
                        .frame(width: 250, alignment: .leading)
                    
                }
                
                HStack{
                    ZStack {
                        Rectangle()
                            .frame(width: 50, height: 50, alignment: .center)
                            .overlay( RoundedRectangle(cornerRadius: 30).stroke(Color(modelTop.colorManager(color: "base_white")), lineWidth: 1.5).background(modelTop.colorManager(color: "base_white")))
                            .cornerRadius(60)
                        
                        Image("avion")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                    }
                    .padding(.leading, -20)
                    
                    modelTop.textLabel("Aeropuerto Madrid Barajas", .system(size: 18), fontColor: "base_black")
                        .frame(width: 250, alignment: .leading)
                }
                
                HStack{
                    ZStack {
                        Rectangle()
                            .frame(width: 50, height: 50, alignment: .center)
                            .overlay( RoundedRectangle(cornerRadius: 30).stroke(Color(modelTop.colorManager(color: "base_white")), lineWidth: 1.5).background(modelTop.colorManager(color: "base_white")))
                            .cornerRadius(60)
                        Image("ubicacion")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                    }
                    .padding(.leading, -20)
                    
                    modelTop.textLabel("Estación de Atocha", .system(size: 18), fontColor: "base_black")
                        .frame(width: 250, alignment: .leading)
                }

            }
            .padding(.top, -200)
        }
    }
}
