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
    
    var index : Int!
    
    var coordinate1, coordinate2, coordinate3: CLLocationCoordinate2D!
    
    var string1 = "Quang Nam"
    
    var string1s = "The place where I was born"
    
    var string2 = "Da Nang"
    
    var string2s = "The city where I learn now"
    
    var string3 = "Tam Ki"
    
    var string3s = "The place where i would like to visit"
    
    override func loadView() {
        // create map view
        mapView = MKMapView()
        // set it into view
        view = mapView
        
        mapView.delegate = self
        
        coordinate1 = CLLocationCoordinate2DMake(15.634347, 108.249935)
        
        coordinate2 = CLLocationCoordinate2DMake(16.068896, 108.155556)
        
        coordinate3 = CLLocationCoordinate2DMake(15.567349, 108.477041)
        
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
        
        // gold challenge
        
        let buttonForGC = UIButton(type: UIButtonType.system)
        
        buttonForGC.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
        
        buttonForGC.setTitle("Pin Location", for: .normal)
        
        buttonForGC.setTitleColor(UIColor.blue ,for: .normal)
        
        buttonForGC.layer.cornerRadius = 5
        
        buttonForGC.addTarget(self, action: #selector(MapViewController.buttonActionForGoldChallenge(sender:)), for: .touchUpInside)
        
        buttonForGC.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(buttonForGC)
        
        let bottomConstraintBtnGC = buttonForGC.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        
        let marginsBtnGC = view.layoutMarginsGuide
        
        let leadingConstraintBtnGC = buttonForGC.leadingAnchor.constraint(equalTo: marginsBtnGC.leadingAnchor)
        
        let trailingConstraintBtnGC = buttonForGC.trailingAnchor.constraint(equalTo: marginsBtnGC.trailingAnchor)
        
        bottomConstraintBtnGC.isActive = true
        
        leadingConstraintBtnGC.isActive = true
        
        trailingConstraintBtnGC.isActive = true
        
        
        
        
        
        
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
    
    // gold challenge
    
    @objc func buttonActionForGoldChallenge(sender: UIButton!) {
        switch index {
            
        case nil, 2:
            index = 0
            point(title: string1, subTitle: string1s, coordinate: coordinate1)
            
        case 0:
            index = 1
            point(title: string2, subTitle: string2s, coordinate: coordinate2)
            
        case 1:
            index = 2
            point(title: string3, subTitle: string3s, coordinate: coordinate3)
            
        default:
            break
        }
    }
    
    private func point(title: String!, subTitle: String!, coordinate: CLLocationCoordinate2D) {
        
        let region = MKCoordinateRegionMakeWithDistance(coordinate, 700, 700)
        
        mapView.setRegion(region, animated: true)
        
        let point = MKPointAnnotation()
        
        point.coordinate = coordinate
        
        point.title = title
        
        point.subtitle = subTitle
        
        mapView.addAnnotation(point)
  
    }
    
    func mapViewForGoldChallenge(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
       
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: "Text") as? MKPinAnnotationView
        
        if pinView == nil {
            
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Text")
            
            pinView!.canShowCallout = true
            
            pinView!.animatesDrop = true
            
            pinView!.pinTintColor = MKPinAnnotationView.purplePinColor()
        } else {
            
            pinView!.annotation = annotation
        }
        
        return pinView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loadetd its views")
 
    }
    
}
