//
//  MapViewController.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 07/03/25.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var locationManager = CLLocationManager()
    var initialLocation = CLLocation(latitude: 23.027761414755965, longitude: 72.50702246370568)
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        checkDeviceLocationPermission()
        centerLocation()
        cameraBoundary()
        addAnnotation()
    }
    
//    MARK: - Methods
    
    func checkDeviceLocationPermission() {
        if CLLocationManager.locationServicesEnabled() {
            self.checkAppLocationPermission()
        }
    } // checks if location of device is on or off
    
    func checkAppLocationPermission() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            break
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            mapView.showsUserLocation = true
            break
        default:
            break
        }
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.startUpdatingHeading()
    } // checks if location permission for our app is on or off
    
    func centerLocation() {
        let region = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
    }
    
    func cameraBoundary() {
        let region = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 2000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
    }
    
    func addAnnotation() {
        let annotation = MKPointAnnotation()
//        MKAnnotation
        annotation.title = "Iscon Thal"
        annotation.coordinate = CLLocationCoordinate2D(latitude: initialLocation.coordinate.latitude, longitude: initialLocation.coordinate.longitude)
        mapView.addAnnotation(annotation)
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }
}
