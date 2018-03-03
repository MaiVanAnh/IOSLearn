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
        
        //let topContraint = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor)
        
        let topContraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        topContraint.isActive = true
        
        leadingConstraint.isActive = true
        
        trailingConstraint.isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loadetd its views")
    }
    
}
