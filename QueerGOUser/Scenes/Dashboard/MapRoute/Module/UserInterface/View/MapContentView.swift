//
//  MapContentView.swift
//  QueerGOUser
//
//  Created by Bresnier Moreno on 23/7/24.
//

import SwiftUI
import MapKit

@available(iOS 17.0, *)
struct MapContentView: View {
    
    @StateObject private var locationManager = MapPresenter()
    
    private let modelTop = ModelTop()
    @State private var isOpen = false
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Map(coordinateRegion: $locationManager.region, showsUserLocation: true)
                    .edgesIgnoringSafeArea(.all)
                    .padding(.bottom, modelTop.deviceHeight / 2.15)
                    .onTapGesture {
                        modelTop.hideKeyboard()
                    }
                
                VStack {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .foregroundColor(modelTop.colorManager(color: "secondary"))
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: modelTop.deviceWidth, height: 300, alignment: .bottom)
                            .padding(.bottom, -100)
                        
                        ZStack {
                            Spacer()
                            HStack {
                                BottomSheetView()
                            }
                            
                        }
                        .padding(.top, 40)
                        .frame(width: modelTop.deviceWidth, height: 400)
                        .background(modelTop.colorManager(color: "base_white"))
                        .cornerRadius(25, corners: [.topLeft, .topRight])
                        .shadow(radius: 3, x:0, y:-3)
                        
                    }
                }
            }
        }
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}


@available(iOS 17.0, *)
#Preview {
    MapContentView()
}
