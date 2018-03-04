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

class MapViewController : UIViewController, MKMapViewDelegate {
    
    var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func loadView() {
        // create map view
        mapView = MKMapView()
        // set it into view
        view = mapView
        
        mapView.delegate = self
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
     
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
        
        let topContraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        
        let margins = view.layoutMarginsGuide
        
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topContraint.isActive = true
        
        leadingConstraint.isActive = true
        
        trailingConstraint.isActive = true
        
        // ----- Silver Challege : create button programmatically
        
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        
        button.setTitle("Show location", for: .normal)
        
        button.setTitleColor(UIColor.white, for: .normal)
        
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(MapViewController.buttonAction(sender:)), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        
        let bottomConstraintBtn = button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        
        let marginsBtn = view.layoutMarginsGuide
        
        let leadingConstraintBtn = button.leadingAnchor.constraint(equalTo: marginsBtn.leadingAnchor)
        
        let trailingConstraintBtn = button.trailingAnchor.constraint(equalTo: marginsBtn.trailingAnchor)
        
        bottomConstraintBtn.isActive = true
        
        leadingConstraintBtn.isActive = true
        
        trailingConstraintBtn.isActive = true
    }
    
    @objc func mapTypeChanged(_ segControl : UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    @objc func buttonAction(sender: UIButton) {
        
        locationManager.requestWhenInUseAuthorization()
        
        mapView.showsUserLocation = !mapView.showsUserLocation
        
        if mapView.showsUserLocation == true {
            sender.setTitle("Hide location", for: .normal)
        } else {
            sender.setTitle("Show location", for: .normal)
        }
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        let region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 500, 500)
        
        mapView.setRegion(region, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loadetd its views")
 
    }
    
}
