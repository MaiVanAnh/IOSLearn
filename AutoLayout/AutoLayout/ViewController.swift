//
//  ViewController.swift
//  AutoLayout
//
//  Created by Hieu on 2/2/18.
//  Copyright © 2018 Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ViewBlue: UIView!
    
    @IBOutlet weak var boundBlueValueX: UISlider!
    
    @IBOutlet weak var frameBlueValueX: UISlider!
    
    @IBAction func actionBound(_ sender: AnyObject) {
        ViewBlue.bounds.origin.x = CGFloat(boundBlueValueX.value)
    }
    
    @IBAction func actionFrame(_ sender: AnyObject) {
        ViewBlue.frame.origin.x = CGFloat(frameBlueValueX.value)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

