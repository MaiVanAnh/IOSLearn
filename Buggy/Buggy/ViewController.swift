//
//  ViewController.swift
//  Buggy
//
//  Created by Van Anh on 3/5/18.
//  Copyright © 2018 Van Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Method: \(#function) in file: \(#file) line: \(#line) called.")
        
        badMethod()
    }
    
    func badMethod() {
        let array = NSMutableArray()
    
        for i in 0..<10 {
            array.insert(i, at: i)
        }
        
        // go to step too far emptying the array (notice the range change)
        
        for _ in 0..<10 {
            array.remove(0)
        }
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

