//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Van Anh on 3/2/18.
//  Copyright © 2018 Anh. All rights reserved.
//

//import Foundation

import UIKit

import MapKit

class MapViewController : UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        // create map view
        mapView = MKMapView()
        // set it into view
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loadetd its views")
    }
    
}