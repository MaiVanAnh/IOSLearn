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
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loadetd its views")
    }
    
}
