//
//  ModelTop.swift
//  QueerGOUser
//
//  Created by Bresnier Moreno on 17/7/24.
//

import Foundation
import SwiftUI
import UIKit

@available(iOS 17.0, *)
class ModelTop: UIViewController {
    
    public var deviceHeight = UIScreen.main.bounds.height
    public var deviceWidth = UIScreen.main.bounds.width
    
    func colorManager(color: String) -> Color {
        switch color {
        case "primary":
            return Color(Color(cgColor: .init(red: 121/255, green: 2/255, blue: 170/255, alpha: 1.0)))
        case "secondary":
            return Color(Color(cgColor: .init(red: 239/255, green: 206/255, blue: 41/255, alpha: 1.0)))
        case "base_white":
            return Color(Color(cgColor: .init(red: 242/255, green: 247/255, blue: 242/255, alpha: 1.0)))
        case "base_black":
            return Color(Color(cgColor: .init(red: 10/255, green: 10/255, blue: 11/255, alpha: 1.0)))
        case "success":
            return Color(Color(cgColor: .init(red: 164/255, green: 244/255, blue: 231/255, alpha: 1.0)))
        case "warning":
            return Color(Color(cgColor: .init(red: 244/255, green: 199/255, blue: 144/255, alpha: 1.0)))
        case "error":
            return Color(Color(cgColor: .init(red: 228/255, green: 98/255, blue: 111/255, alpha: 1.0)))
        case "error100":
            return Color(Color(cgColor: .init(red: 228/255, green: 98/255, blue: 111/255, alpha: 1.0)))
            
        case "neutrals100":
            return Color(Color(cgColor: .init(red: 227/255, green: 227/255, blue: 227/255, alpha: 1.0)))
        case "neutrals200":
            return Color(Color(cgColor: .init(red: 204/255, green: 203/255, blue: 203/255, alpha: 1.0)))
        case "neutrals300":
            return Color(Color(cgColor: .init(red: 181/255, green: 179/255, blue: 179/255, alpha: 1.0)))
        case "neutrals400":
            return Color(Color(cgColor: .init(red: 159/255, green: 156/255, blue: 156/255, alpha: 1.0)))
        case "neutrals500":
            return Color(Color(cgColor: .init(red: 137/255, green: 131/255, blue: 132/255, alpha: 1.0)))
        case "neutrals700":
            return Color(Color(cgColor: .init(red: 90/255, green: 85/255, blue: 85/255, alpha: 1.0)))
        case "neutrals800":
            return Color(Color(cgColor: .init(red: 67/255, green: 62/255, blue: 63/255, alpha: 1.0)))
        case "gray":
            return Color(Color(cgColor: .init(red: 67/255, green: 62/255, blue: 63/255, alpha: 1.0)))
        default:
            return Color(Color(cgColor: .init(red: 10/255, green: 10/255, blue: 11/255, alpha: 1.0)))
        }
    }

    
    func textLabel(_ text: String, _ font: Font, fontColor: String) -> Text {
        Text(text)
            .font(font)
            .foregroundColor(self.colorManager(color: fontColor))
    }
    
    func isIphoneSE() -> Bool {
        let iphoneSEHeight = UIScreen.main.bounds.height
        if iphoneSEHeight == 667 {
            return true
        }
        return false
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    //    func homeSheetMapFile(image: String, text: String) {
    //        Image(image)
    //            .resizable()
    //            .scaledToFill()
    //            .frame(width: 30, height: 30)
    //            .padding(.trailing, 10)
    //
    //        textLabel(text, .system(size: 18), fontColor: .baseBlack)
    //            .frame(width: 350, alignment: .leading)
    //            .padding(.leading, 10)
    //    }
    
}
