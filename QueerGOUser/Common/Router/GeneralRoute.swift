//
//  GeneralRoute.swift
//  QueerGOUser
//
//  Created by Bresnier Moreno on 17/7/24.
//

import UIKit
import SwiftUI

@available(iOS 17.0, *)
enum GeneralRoute: IRouter {
    case home
}

@available(iOS 17.0, *)
extension GeneralRoute {
    var scene: UIViewController? {
        switch self {
        case .home:
            return UIHostingController(rootView: HomeView())
        }
    }
}

