//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Van Anh on 2/28/18.
//  Copyright © 2018 Anh. All rights reserved.
//

//import Foundation

import UIKit

class ConversionViewController : UIViewController {
    
    //var value : Double?
    
    @IBOutlet weak var celsiusLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    var fahrenheitValue : Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue : Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        }
        else {
            return nil
        }
    }
    
    let numberFormatter : NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func updateCelsiusLabel(){
        if let celsiusValue = celsiusLabel {
            celsiusLabel.text = "\(celsiusValue.hashValue)"
            
        }
        else {
            celsiusLabel.text = "???"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCelsiusLabel()
    }
    
    @IBAction func dismissKeyboard(_ sender : AnyObject) {
        textField.resignFirstResponder()
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
//        if let text = textField.text, !text.isEmpty {
//            celsiusLabel.text = text
//        }
//        else
//        {
//            celsiusLabel.text = "???"
//        }
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value : value, unit : .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
     }
    

    
    
}
