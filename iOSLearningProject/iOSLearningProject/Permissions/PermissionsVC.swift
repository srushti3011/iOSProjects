//
//  PermissionsVC.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 20/06/25.
//

import UIKit
import CoreLocation
import Photos
import Contacts

class PermissionsVC: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    // MARK: Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
    }
    
    // MARK: IBActions
    @IBAction func btnUserLocationAction(_ sender: UIButton) {
        print(locationManager.authorizationStatus.rawValue)
    }
    
    @IBAction func btnPhotoLibraryAccessAction(_ sender: UIButton) {
        PHPhotoLibrary.requestAuthorization(for: .addOnly) { status in
            switch status {
            case .notDetermined:
                print("notDetermined - photo library")
            case .restricted:
                print("restricted - photo library")
            case .denied:
                print("denied - photo library")
            case .authorized:
                print("authorized - photo library")
            case .limited:
                print("limited - photo library")
            @unknown default:
                print("unknown - photo library")
            }
        }
    }
    
    @IBAction func btnContactsAccessAction(_ sender: UIButton) {
        requestContactAccess()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            print("not determined - Location")
            manager.requestWhenInUseAuthorization()
            break
        case .restricted:
            print("restricted - Location")
        case .denied:
            print("denied initially - Location")
            if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
            }
        case .authorizedAlways:
            print("authorized always - Location")
        case .authorizedWhenInUse:
            print("authorized when in use - Location")
        @unknown default:
            print("unknown - Location")
        }
    }
    
    // MARK: Instance methods
    private func requestContactAccess() {
        let store = CNContactStore()
        switch CNContactStore.authorizationStatus(for: .contacts) {
            case .notDetermined:
                store.requestAccess(for: .contacts) { granted, error in
                    if granted {
                        print(granted)
                    }
                }
            case .authorized:
                print("authorized")
            case .denied:
                print("denied")
            case .restricted:
                print("restricted")
            case .limited:
                print("limited")
            @unknown default:
                print("error")
        }
    }
}
