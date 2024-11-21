//
//  LoginInteractor.swift
//  QueerGOUser
//
//  Created by Bresnier Moreno on 23/7/24.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift
import AuthenticationServices
import CryptoKit

class LoginInteractor: UIViewController, ObservableObject, ASAuthorizationControllerDelegate {
    
    private var userTokenID: GIDToken?
    var jsonData: Array<Any>?
    
    private var currentNonce: String?
    private var arrayToken: [[String: Any]]?
    
    //MARK: - Apple SignIn
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: [Character] =
        Array("QueerGO App for users.")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError(
                        "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
                    )
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
    
    @available(iOS 13, *)
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    @available(iOS 13, *)
    func startSignInWithAppleFlow() {
        
        let nonce = randomNonceString()
        currentNonce = nonce
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = currentNonce else {
                fatalError("Invalid state: A login callback was received, but no login request was sent.")
            }
            
            // Obtener el authorization_code (Code)
            guard let appleIDToken = appleIDCredential.authorizationCode else {
                print("Unable to fetch identity token")
                return
            }
            guard let authorization_code = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                return
            }
            
            // Obtener el id_token (ID Token)
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("Unable to fetch identity token")
                return
            }
            guard let id_token = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                return
            }
            
//             Initialize Firebase credential.
            let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                      idToken: id_token,
                                                      rawNonce: nonce)
            
            if id_token != "" {
                let array: [[String: Any]] = [
                    ["code" : authorization_code],
                    ["id_token" : id_token]
                ]
                self.arrayToken = array
                postSignInWithApple()
            }
            
            // Sign in with Firebase.
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if (error != nil) {
                    // Error. If error.code == .MissingOrInvalidNonce, make sure
                    // you're sending the SHA256-hashed nonce as a hex string with
                    // your request to Apple.
                    print(error?.localizedDescription)
                    return
                }
                print("Apple sign in!")
                // Allow proceed to next screen
            }
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
        print("Sign in with Apple errored: \(error)")
    }
        
    func postSignInWithApple() {
        
        let tokenArray = self.arrayToken
        
        let url = "https://api.queergo.com/api/auth/callback/apple"
        //        var serializer = DataResponseSerializer(emptyResponseCodes: Set([200, 400, 500]))
        
        var userDataRequest = URLRequest(url: URL(string: url)!)
        userDataRequest.httpMethod = HTTPMethod.post.rawValue
        
        
        AF.request(url, method: .post, parameters: ["data": tokenArray], encoding: JSONEncoding.default).response { response in
            
            switch response.result {
            case .success(let data):
                if let jsonData = data {
                    
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                        print("Respuesta del servidor: \(jsonString)")
                    }
                }
            case .failure(let error):
                print("Error1: \(String(describing: response.error))")
                print("Error2: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - Cargar archivo .p8 y firmar el JSON Web Token
    
    // Función para cargar el archivo .p8 desde el bundle del proyecto
//    func loadPrivateKeyFromFile(named fileName: String) -> String? {
//        if let filePath = Bundle.main.path(forResource: fileName, ofType: "p8") {
//            do {
//                let privateKey = try String(contentsOfFile: filePath, encoding: .utf8)
//                return privateKey
//                
//            } catch {
//                print("Error al cargar el archivo .p8: \(error)")
//            }
//        }
//        return nil
//    }
//
//    // Crear un JWT para la autenticación
//    func createJWT(usingPrivateKey privateKey: String, keyId: String, teamId: String, clientId: String) -> String? {
//        let header = ["alg": "ES256", "kid": keyId, "typ": "JWT"]
//        let payload = [
//            "iss": teamId,
//            "iat": Int(Date().timeIntervalSince1970),
//            "exp": Int(Date().timeIntervalSince1970) + 3600, // Expira en 1 hora
//            "aud": "https://appleid.apple.com",
//            "sub": clientId
//        ] as [String : Any]
//
//        guard let headerData = try? JSONSerialization.data(withJSONObject: header),
//              let payloadData = try? JSONSerialization.data(withJSONObject: payload) else {
//            return nil
//        }
//
//        let headerBase64 = headerData.base64EncodedString().replacingOccurrences(of: "=", with: "")
//        let payloadBase64 = payloadData.base64EncodedString().replacingOccurrences(of: "=", with: "")
//        let unsignedToken = "\(headerBase64).\(payloadBase64)"
//
//        guard let privateKeyData = Data(base64Encoded: privateKey),
//              let signature = sign(unsignedToken: unsignedToken, withPrivateKey: privateKeyData) else {
//            return nil
//        }
//
//        let jwt = "\(unsignedToken).\(signature)"
//        return jwt
//    }
//
//    // Firmar el JWT con la clave privada
//    func sign(unsignedToken: String, withPrivateKey privateKey: Data) -> String? {
//        guard let privateKey = try? P256.Signing.PrivateKey(rawRepresentation: privateKey) else {
//            return nil
//        }
//
//        let tokenData = Data(unsignedToken.utf8)
//        let signature = try? privateKey.signature(for: tokenData)
//
//        return signature?.derRepresentation.base64EncodedString().replacingOccurrences(of: "=", with: "")
//    }
    
    // MARK: - Obtener el authorization_code
    
//    func requestAuthorizationCode(clientId: String, clientSecret: String, code: String, redirectUri: String, completion: @escaping (String?) -> Void) {
//        let url = URL(string: "https://appleid.apple.com/auth/token")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        
//        let bodyParams = [
//            "grant_type": "authorization_code",
//            "code": code,
//            "redirect_uri": redirectUri,
//            "client_id": clientId,
//            "client_secret": clientSecret
//        ]
//        
//        request.httpBody = bodyParams
//            .map { "\($0.key)=\($0.value)" }
//            .joined(separator: "&")
//            .data(using: .utf8)
//        
//        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {
//                print("Error en la solicitud: \(error?.localizedDescription ?? "Desconocido")")
//                completion(nil)
//                return
//            }
//            
//            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                if let accessToken = json["access_token"] as? String {
//                    completion(accessToken)
//                } else {
//                    print("No se encontró el access token en la respuesta")
//                    completion(nil)
//                }
//            } else {
//                print("Error al procesar la respuesta")
//                completion(nil)
//            }
//        }
//        
//        task.resume()
//    }
    
//    func getJsonWebTokenSigned() {
//        let clientId = "com.naimtech.QueerGOUser"
//        let keyId = "MFXK8Q98A3"
//        let teamId = "9H4UZHA9D6"
//        
//        let code = self.idCodeString ?? ""
//        let redirectUri = "https://api.queergo.com/api/auth/callback/apple"
//        
//        if let privateKey = loadPrivateKeyFromFile(named: "AuthKey_MFXK8Q98A3") {
//            if let jwt = createJWT(usingPrivateKey: privateKey, keyId: keyId, teamId: teamId, clientId: clientId) {
//                
//                print("JWT generado: \(jwt)")
//                requestAuthorizationCode(clientId: clientId, clientSecret: jwt, code: code, redirectUri: redirectUri) { authorizationCode in
//                    if let authorizationCode = authorizationCode {
//                        
//                            print("Authorization Code obtenido: \(authorizationCode)")
//                        UserDefaults.standard.set(authorizationCode, forKey: "authorization_code")
//                    } else {
//                        print("No se pudo obtener el access token")
//                    }
//                }
//            } else {
//                print("Error al generar el JWT")
//            }
//        }
//    }
    
    // MARK: - Google SignIn
    
    func signInWithGoogle() async -> Bool {
        
        //        guard let clientID = FirebaseOptions().clientID else {
        //            fatalError("No se encuentra el client ID en Firebase")
        //        }
        let clientID = "311715755631-aibmesr976p89pefuq18v26ma9ufqlrc.apps.googleusercontent.com"
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let windowScene = await UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = await windowScene.windows.first,
              let rootViewController = await window.rootViewController else {
            print("No hay root view controller")
            return false
        }
        
        do {
            let userAuthentication = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
            let user = userAuthentication.user
            guard let idToken = user.idToken else {
                throw AuthenticationError.missingCredential
            }
            let accessToken = user.accessToken
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
            let result = try await Auth.auth().signIn(with: credential)
            let firebaseUser = result.user
            self.userTokenID = accessToken
            
            print("Usuario \(firebaseUser.displayName) logueado con el correo \(firebaseUser.email ?? "unknow")")
            postSignInWithGoogle()
            return true
        }
        catch {
            print(error.localizedDescription)
            let errorMessage = error.localizedDescription
            return false
        }
    }
    
    func postSignInWithGoogle() {
        
        let url = "https://api.queergo.com/api/auth-mobile/google/login"
        var serializer = DataResponseSerializer(emptyResponseCodes: Set([200, 400, 500]))
        
        var userDataRequest = URLRequest(url: URL(string: url)!)
        userDataRequest.httpMethod = HTTPMethod.post.rawValue
        
        AF.upload(multipartFormData: { multipartFormData in
            
            multipartFormData.append(Data((self.userTokenID?.tokenString.utf8)!), withName: self.userTokenID?.tokenString ?? "")
            
        }, to: url, method: .post)
        
        .uploadProgress { progress in
            
            print(CGFloat(progress.fractionCompleted))
            
        }
        
        .response { response in
            
            if (response.error == nil) {
                
                do {
                    let json = try JSON(data: response.data!)
                    print("Parsed JSON: \(json)")
                    
                } catch {
                    print("Failed to parse JSON: \(error)")
                }
            }
        }
    }
}
