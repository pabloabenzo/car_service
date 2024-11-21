//
//  LoginPhoneVerifyView.swift
//  QueerGOUser
//
//  Created by Pablo Benzo on 20/08/2024.
//

import SwiftUI

@available(iOS 17.0, *)
struct LoginPhoneVerifyView: View {
    
    var modelTop = ModelTop()
    var signUpUserData = UserDataView()
    
    @State private var isNavigating = false
    @State private var isLoading = false
    
    enum FocusPin {
        case  pinOne, pinTwo, pinThree, pinFour
    }
    
    @FocusState private var pinFocusState : FocusPin?
    @State var pinOne: String = ""
    @State var pinTwo: String = ""
    @State var pinThree: String = ""
    @State var pinFour: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("logo_relleno")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: modelTop.deviceHeight / 1.8)
                    .onTapGesture {
                        modelTop.hideKeyboard()
                    }
                
                ZStack {
                    
                    VStack {
                        
                        modelTop.textLabel("VERIFICA TU MÓVIL", .custom("MontserratRoman-Bold", size: 44).bold(), fontColor: "primary")
                            .multilineTextAlignment(.center)
                            .frame(width: 400, height: 120)
                            .lineLimit(2)
                            .padding(.top, modelTop.deviceHeight / 20).padding(.bottom, modelTop.deviceHeight / 8)
                        
                        modelTop.textLabel("Introduce los 4 digitos que \n han sido enviados al móvil:", .custom("OpenSans-Regular", size: 22), fontColor: "base_white")
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .frame(width: modelTop.deviceWidth / 1.3, height: 66)
                        
                        modelTop.textLabel("+34 675890034", .custom("OpenSans-Regular", size: 22), fontColor: "base_white")
                            .italic()
                            .multilineTextAlignment(.center)
                            .frame(width: modelTop.deviceWidth / 1.5, height: 50)
                        
                        HStack(spacing:15, content: {
                            
                            TextField("", text: $pinOne)
                                .foregroundColor(.black)
                                .modifier(FormFieldModifier(pin:$pinOne))
                                .onChange(of:pinOne){newVal in
                                    if (newVal.count == 1) {
                                        pinFocusState = .pinTwo
                                    }
                                }
                                .focused($pinFocusState, equals: .pinOne)
                            
                            TextField("", text:  $pinTwo)
                                .foregroundColor(.black)
                                .modifier(FormFieldModifier(pin:$pinTwo))
                                .onChange(of:pinTwo){newVal in
                                    if (newVal.count == 1) {
                                        pinFocusState = .pinThree
                                    }else {
                                        if (newVal.count == 0) {
                                            pinFocusState = .pinOne
                                        }
                                    }
                                }
                                .focused($pinFocusState, equals: .pinTwo)

                            
                            TextField("", text:$pinThree)
                                .foregroundColor(.black)
                                .modifier(FormFieldModifier(pin:$pinThree))
                                .onChange(of:pinThree){newVal in
                                    if (newVal.count == 1) {
                                        pinFocusState = .pinFour
                                    }else {
                                        if (newVal.count == 0) {
                                            pinFocusState = .pinTwo
                                        }
                                    }
                                }
                                .focused($pinFocusState, equals: .pinThree)

                            
                            TextField("", text:$pinFour)
                                .foregroundColor(.black)
                                .modifier(FormFieldModifier(pin:$pinFour))
                                .onChange(of:pinFour){newVal in
                                    if (newVal.count == 0) {
                                        pinFocusState = .pinThree
                                    }
                                }
                                .focused($pinFocusState, equals: .pinFour)

                                
                        })
                        .padding(.vertical)
                        
                        Text("Escribe el codigo en **0:30**")
                            .font(.custom("OpenSans-Regular", size: 20))
                            .foregroundColor(modelTop.colorManager(color: "base_white"))
                            .multilineTextAlignment(.center)
                            .frame(width: modelTop.deviceWidth / 1.5, height: 50, alignment: .center)
                            .lineLimit(2)
                            .padding(.bottom, 80)
                        
                        if modelTop.isIphoneSE() == false {
                            
                            Image("queergo_logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: modelTop.deviceWidth / 4)
                                .padding(.bottom, 5).padding(.top, 15)
                            
                        } else {
                            
                            Button {
                                // logica
                            } label: {
                                modelTop.textLabel("Siguiente", .system(size: 25).bold(), fontColor: "base_white")
                            }
                            .frame(width: modelTop.deviceWidth / 2, height: 50)
                            .background(modelTop.colorManager(color: "primary"))
                            .cornerRadius(6)
                            .shadow(color: .gray, radius: 2, x: 0, y: 2)
                            .padding(.bottom, 100)
                        }
                        
                        if modelTop.isIphoneSE() == false {
                            
                            Button(action: loadAndNavigate) {
                                
                                modelTop.textLabel("Siguiente", .custom("OpenSansRoman-SemiBold", size: 18).bold(), fontColor: "base_white")
                            }
                            .frame(width: modelTop.deviceWidth / 2, height: 50)
                            .background(modelTop.colorManager(color: "primary"))
                            .cornerRadius(6)
                            .shadow(color: .gray, radius: 2, x: 0, y: 2)
                            .padding(.bottom, 20)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .padding()
                    
                    if isLoading {
                        ZStack {
                            Color.gray.opacity(0.3)
                                .edgesIgnoringSafeArea(.all)
                            ProgressView("")
                                .progressViewStyle(CircularProgressViewStyle())
                            
                            NavigationLink(
                                destination: UserDataView(),
                                isActive: $isNavigating
                            ) { }
                        }
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
    LoginPhoneVerifyView()
}
