//
//  DateCreatedViewController.swift
//  Homepwner
//
//  Created by Van Anh on 4/18/18.
//  Copyright © 2018 Van Anh. All rights reserved.
//

import UIKit

class DateCreatedViewController: UIViewController {
    
    var datePicker: UIDatePicker!
    
    var item: Item!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Date Create"
        
        datePicker = UIDatePicker()
        
        datePicker.datePickerMode = .date
        
        datePicker.date = item.dateCreated
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(datePicker)
        
        datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        item.dateCreated = datePicker.date
    }
}
