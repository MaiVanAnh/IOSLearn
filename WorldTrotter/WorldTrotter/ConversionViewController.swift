//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Van Anh on 2/28/18.
//  Copyright © 2018 Anh. All rights reserved.
//

//import Foundation

import UIKit

class ConversionViewController : UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue : Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue : Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
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
        if let celsiusValue = celsiusValue {
            //celsiusLabel.text = "\(celsiusValue.value)"
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        }
        else {
            celsiusLabel.text = "???"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCelsiusLabel()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range : NSRange, replacementString string: String) -> Bool {
//        print("Current text: \(textField.text)")
//        print("Replacement text : \(string)")
//        return true
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        if existingTextHasDecimalSeparator != nil, replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
        
        let lettersCharacters = NSCharacterSet.letters
        
        let containLetterCharacters = string.rangeOfCharacter(from: lettersCharacters)
        
        if containLetterCharacters != nil {
            return false
        } else {
            return true
        }
        
        let specialCharactors = ["!", "@", "#", "$", "%", "^", "&", "*"," "]
        
            for specialCharactor in specialCharactors {
                if string == specialCharactor {
                    print("Not allowed")
                    return false
                } else {
                    return true
                }
            
        }
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
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
     }
 
}