//
//  ViewController.swift
//  Homework 7
//
//  Created by Spencer Curran on 4/21/20.
//  Copyright © 2020 Spencer Curran. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    
    
    
    @IBOutlet weak var distanceLabel: UILabel!
    

    let locMan: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    // latitude
    let washLatitude: CLLocationDegrees = 46.8523
    // longitude
    let washLongitude: CLLocationDegrees = 121.7603
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        let newLocation: CLLocation=locations[0]
        NSLog("somethings happening")
        if newLocation.horizontalAccuracy >= 0 {
            let wash:CLLocation = CLLocation(latitude: washLatitude,longitude:washLongitude)
            let delta:CLLocationDistance = wash.distance(from: newLocation)
            let miles: Double = (delta + 0.000621371) + 0.5
            if miles < 3 {
                distanceLabel.text = "Enjoy\n Mount Rainier!"
            } else {
                let commaDelimited: NumberFormatter = NumberFormatter()
                commaDelimited.numberStyle = NumberFormatter.Style.decimal
                distanceLabel.text=commaDelimited.string(from: NSNumber(value: miles))!+"Miles to Mt. Rainier"
            }
        }
        
    
        
        
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locMan.delegate = self
        locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locMan.distanceFilter = 1609; //mile measurement
        locMan.requestWhenInUseAuthorization()
        locMan.startUpdatingLocation()
        startLocation = nil
    }


}

