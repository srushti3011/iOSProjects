//
//  MapAndPickerViewController.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 07/03/25.
//

import UIKit
import MapKit

class MapAndPickerViewController: UIViewController {
    
    
    @IBOutlet weak var pickerLocation: UIPickerView!
    @IBOutlet weak var mapLocationSelected: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerLocation.delegate = self
        pickerLocation.dataSource = self
        checkDeviceLocationPermission()
        centerLocation(locationDetail: locationDetails[0])
//        setAnnotation(locationDetail: locationDetails[0])
    }
    
    func checkDeviceLocationPermission() {
        if CLLocationManager.locationServicesEnabled() {
            self.checkAppLocationPermission()
        }
    }
    
    func checkAppLocationPermission() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapLocationSelected.showsUserLocation = true
            break
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            mapLocationSelected.showsUserLocation = true
            break
        default:
            break
        }
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.startUpdatingHeading()
        
    }
    
    func centerLocation(locationDetail: LocationDetailItem) {
        let region = MKCoordinateRegion(center: locationDetail.coordinates.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapLocationSelected.setRegion(region, animated: true)
        setAnnotation(locationDetail: locationDetail)
    }
    
    func setAnnotation(locationDetail: LocationDetailItem) {
        let annotation = MKPointAnnotation()
        annotation.title = locationDetail.name
        annotation.coordinate = CLLocationCoordinate2D(latitude: locationDetail.coordinates.coordinate.latitude, longitude: locationDetail.coordinates.coordinate.longitude)
        mapLocationSelected.addAnnotation(annotation)
    }
}

// MARK: - Set the PickerView
extension MapAndPickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locationDetails.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locationDetails[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        centerLocation(locationDetail: locationDetails[row])
    }
}

// MARK: - Set the MapView
extension MapAndPickerViewController: CLLocationManagerDelegate {
    
}
