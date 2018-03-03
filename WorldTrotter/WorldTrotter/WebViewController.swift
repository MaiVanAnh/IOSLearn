//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Van Anh on 3/3/18.
//  Copyright © 2018 Anh. All rights reserved.
//

//import Foundation

import UIKit

import WebKit

class WebViewController : UIViewController {
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("WebViewController loaded its view!")
        
        let myURL = URL(string: "https://www.bignerdranch.com")
    
        let myRequest = URLRequest(url: myURL!)
        
        webView.load(myRequest)
    }
}
