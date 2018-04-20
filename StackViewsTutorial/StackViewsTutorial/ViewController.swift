//
//  ViewController.swift
//  StackViewsTutorial
//
//  Created by Van Anh on 4/14/18.
//  Copyright © 2018 Van Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBAction func onButton1Clicked(_ sender: UIButton) {
        if image1.isHidden == false {
            UIView.animate(withDuration: 0.3, animations: {()->Void in
                self.image1.isHidden = true
                self.button1.setTitle("Show image 1", for: UIControlState.normal)
                })
        } else {
            UIView.animate(withDuration: 0.3, animations: {()->Void in
                self.image1.isHidden = false
                self.button1.setTitle("Show image 1", for: UIControlState.normal)
            })
        }
    }
    
    @IBAction func onButton2Clicked(_ sender: UIButton) {
        if image2.isHidden == false {
            UIView.animate(withDuration: 0.3, animations: {()->Void in
                self.image2.isHidden = true
                self.button2.setTitle("Show image 2", for: UIControlState.normal)
            })
        } else {
            UIView.animate(withDuration: 0.3, animations: { () ->Void in
                self.image2.isHidden = false
                self.button2.setTitle("Hide image 2", for: UIControlState.normal)
            })
        }
    }
    
    @IBAction func onButton3Clicked(_ sender: UIButton) {
        if image3.isHidden == false {
            UIView.animate(withDuration: 0.3, animations: { () ->Void in
                self.image3.isHidden = true
                self.button3.setTitle("Show Image 3", for: UIControlState.normal)
            })
        } else {
            UIView.animate(withDuration: 0.3, animations: { () ->Void in
                self.image3.isHidden = false
                self.button3.setTitle("Hide Image 3", for: UIControlState.normal)
            })
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

 


}

