//
//  TrackViewController.swift
//  Showcase
//
//  Created by AST-iMac-0015 on 10/27/15.
//  Copyright © 2015 AST-iMac-0015. All rights reserved.
//

import UIKit
import CoreLocation

class TrackViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!
    @IBOutlet weak var locationText: UITextView!
    @IBOutlet weak var toggleSwitch: UISwitch!
    @IBAction func changeToggle(sender: AnyObject) {
        if toggleSwitch.on {
            if (CLLocationManager.locationServicesEnabled() == false) {
                self.toggleSwitch.on = false
            }
            if locationManager == nil {
                locationManager = CLLocationManager()
                locationManager.delegate = self
                locationManager.distanceFilter = 10.0
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager.requestWhenInUseAuthorization()
            }
            locationManager.startUpdatingLocation()
        }
        else
        {
            if locationManager != nil {
                locationManager.stopUpdatingLocation()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        locationText.backgroundColor = UIColor.greenColor()
        locationText.layer.cornerRadius = 4.0
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location:CLLocation = locations[locations.endIndex-1] as CLLocation
        self.locationText.text = location.description;
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
     locationText.text = "failed with error \(error.description) "
    }

}

