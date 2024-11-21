//
//  MapPresenter.swift
//  QueerGOUser
//
//  Created by Bresnier Moreno on 23/7/24.
//

import UIKit
import MapKit
import CoreLocation

@available(iOS 14.0, *)
class MapPresenter: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Coordenadas iniciales
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            region = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            )
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            switch manager.authorizationStatus {
            case .notDetermined:
                print("Permisos de ubicación aún no garantizados")
            case .restricted:
                print("Uso de ubicación es restringido (quiza por control parental o similar)")
            case .denied:
                print("Permisos de ubicación denegados por el usuario")
            case .authorizedAlways:
                print("Permisos de ubicación garantizados para uso en segundo plano y primer plano")
            case .authorizedWhenInUse:
                print("Permisos de ubicación garantizados para uso solo en primer plano")
            @unknown default:
                print("Un estado de autorización desconocida recibido")
            }
        }
    
}
