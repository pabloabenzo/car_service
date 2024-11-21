//
//  FormFieldView.swift
//  QueerGOUser
//
//  Created by Pablo Benzo on 28/09/2024.
//

import SwiftUI
import Combine

@available(iOS 15.0, *)
struct FormFieldView: View {
    
    enum FocusPin {
        case  pinOne, pinTwo, pinThree, pinFour
    }
    
    @FocusState private var pinFocusState : FocusPin?
    @State var pinOne: String = ""
    @State var pinTwo: String = ""
    @State var pinThree: String = ""
    @State var pinFour: String = ""
    
    var body: some View {
            VStack {
    
                Text("Verify your Email Address")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                   
                Text("Enter 4 digit code we'll text you on Email")
                    .font(.caption)
                    .fontWeight(.thin)
                    .padding(.top)
               
                HStack(spacing:15, content: {
                    
                    TextField("", text: $pinOne)
                        .modifier(FormFieldModifier(pin:$pinOne))
                        .onChange(of:pinOne){newVal in
                            if (newVal.count == 1) {
                                pinFocusState = .pinTwo
                            }
                        }
                        .focused($pinFocusState, equals: .pinOne)
                    
                    TextField("", text:  $pinTwo)
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
                        .modifier(FormFieldModifier(pin:$pinFour))
                        .onChange(of:pinFour){newVal in
                            if (newVal.count == 0) {
                                pinFocusState = .pinThree
                            }
                        }
                        .focused($pinFocusState, equals: .pinFour)

                        
                })
                .padding(.vertical)
            
                
                Button(action: {}, label: {
                    Spacer()
                    Text("Verify")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Spacer()
                })
                .padding(15)
                .background(Color.blue)
                .clipShape(Capsule())
                .padding()
            }
        
    }
}

@available(iOS 15.0, *)
struct FormFieldView_Previews: PreviewProvider {
    static var previews: some View {
        FormFieldView()
    }
}
