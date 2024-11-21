//
//  LoginView.swift
//  QueerGOUser
//
//  Created by Bresnier Moreno on 23/7/24.
//

import SwiftUI
import _AuthenticationServices_SwiftUI

@available(iOS 17.0, *)
struct LoginView: View {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var modelTop = ModelTop()
    var loginInteractor = LoginInteractor()
    
    @State private var progress = 0.6
    @State var showView = false
    
    // ProgressView
    @State private var isNavigating = false
    @State private var isLoading = false
    @State private var isLoading2 = false
    @State private var isNavigating2 = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .foregroundColor(modelTop.colorManager(color: "secondary"))
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        modelTop.hideKeyboard()
                    }
                
                VStack {
                    Image("queergo_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .padding(.top, 20)
                    
                    modelTop.textLabel("BIENVENIDE", .custom("Montserrat", size: 44).bold(), fontColor: "primary")
                    
                    Button(action: loadAndNavigate) {
                        
                        modelTop.textLabel("Inicia Sesión", .custom("OpenSansRoman-Bold", size: 18), fontColor: "base_white")
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(modelTop.colorManager(color: "primary"))
                            .cornerRadius(6)
                            .shadow(color: .gray, radius: 2, x: 0, y: 2)
                            .padding(.bottom, 40)
                    }
                    
                    Button {
                        // logica del boton
                    } label: {
                        modelTop.textLabel("¿Has olvidado tu contraseña?", .custom("OpenSansRoman-SemiBold", size: 12), fontColor: "primary")
                    }
                    .frame(maxWidth: .infinity, maxHeight: 40, alignment: .center)
                    .padding(.top, -55).padding(.bottom, 40)
                    
                    Button {
                        Task {
                            await loginInteractor.signInWithGoogle()
                        }
                    } label: {
                        Label {
                            modelTop.textLabel("Continuar con Google", .custom("OpenSansRoman-Bold", size: 18).bold(), fontColor: "primary")
                                .padding(.trailing, 25)
                            Spacer().frame(width: 10)
                        } icon: {
                            Image("google_icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                                .padding(.trailing, modelTop.deviceWidth / 15)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(modelTop.colorManager(color: "base_white"))
                    .cornerRadius(6)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .padding(.bottom, 20)
                    
                    Button {
                        loginInteractor.startSignInWithAppleFlow()
                    } label: {
                        Label {
                            modelTop.textLabel("Continuar con Apple", .custom("OpenSansRoman-Bold", size: 18).bold(), fontColor: "primary")
                                .padding(.trailing, 25)
                        } icon: {
                            Image("apple_icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                                .padding(.trailing, modelTop.deviceWidth / 15)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(modelTop.colorManager(color: "base_white"))
                    .cornerRadius(6)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .padding(.bottom, 40)
                    
                    Button {
                        // logica del boton
                    } label: {
                        modelTop.textLabel("¿No tienes cuenta?", .custom("OpenSansRoman-SemiBold", size: 12).bold(), fontColor: "primary")
                    }
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .padding(.bottom, -15)
                    
                    Button(action: loadAndNavigate2) {
                        modelTop.textLabel("Crea una cuenta", .custom("OpenSansRoman-Bold", size: 18).bold(), fontColor: "base_white")
                    }
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(modelTop.colorManager(color: "primary"))
                    .cornerRadius(6)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .padding(.bottom, 50)
                    
                    
                }
                .padding()
                
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
                } else if isLoading2 {
                    ZStack {
                        Color.gray.opacity(0.3)
                            .edgesIgnoringSafeArea(.all)
                        ProgressView("")
                            .progressViewStyle(CircularProgressViewStyle())
                        
                        NavigationLink(
                            destination: SignUpView(),
                            isActive: $isNavigating2
                        ) { }
                    }
                }
            }
        }
    }
    
    private func loadAndNavigate() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isLoading = false
            isNavigating = true
        }
    }
    
    private func loadAndNavigate2() {
        isLoading2 = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isLoading2 = false
            isNavigating2 = true
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    LoginView()
}
