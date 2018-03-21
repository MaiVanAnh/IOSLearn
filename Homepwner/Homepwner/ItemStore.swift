//
//  ItemStore.swift
//  Homepwner
//
//  Created by Van Anh on 3/21/18.
//  Copyright © 2018 Van Anh. All rights reserved.
//

//import Foundation

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
    @discardableResult func createItem() ->Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
        
    }
    
    init() {
        for _ in 0..<5 {
            
            createItem()
            
        }
    }
}
