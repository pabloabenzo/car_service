//
//  SingUpView.swift
//  QueerGOUser
//
//  Created by Bresnier Moreno on 23/7/24.
//

import SwiftUI

@available(iOS 16.0, *)
struct SingUpViewController: View {
    var body: some View {
        
        ZStack{
            Rectangle()
                .foregroundColor(Color.yellow)
                .ignoresSafeArea()
            ZStack{
                Image("top_view")
                    .scaledToFill()
                Image("bottom_view")
                    .scaledToFill()
                ZStack{
                    
                    Button {
                        // logica del boton
                    } label: {
                        Text("Inicia Sesión")
                    }
                    .frame(width: 310, height: 40)
                    .padding(5)
                    //                .foregroundColor(Color(cgColor: .init(red: 126/255, green: 24/255, blue: 163/255, alpha: 1.0)))
                    .background(.white)
                    .font(.system(size: 25).bold())
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .padding(.bottom, 40)
                    
                    Button {
                        // logica del boton
                    } label: {
                        Text("¿Has olvidado tu contraseña?")
                    }
                    .frame(width: 340, height: 40)
                    .foregroundColor(.purple)
                    .font(.system(size: 12).bold())
                    .padding(.top, -55)
                    
                    Button {
                        // logica del boton
                    } label: {
                        Text("¿No tienes cuenta?")
                    }
                    .frame(width: 340, height: 40)
                    .foregroundColor(.purple)
                    .font(.system(size: 12).bold())
                    .padding(.bottom, -15)
                    
                    Button {
                        LoginInteractor().fetchData()
                    } label: {
                        Text("Crea una cuenta")
                    }
                    .frame(width: 310, height: 40)
                    .padding(5)
                    .foregroundColor(.white)
                    .background(Color(cgColor: .init(red: 126/255, green: 24/255, blue: 163/255, alpha: 1.0)))
                    .font(.system(size: 25).bold())
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .padding(.bottom, 50)
                }
            }
        }
    }
}

@available(iOS 16.0, *)
#Preview() {
    SingUpView()
}
