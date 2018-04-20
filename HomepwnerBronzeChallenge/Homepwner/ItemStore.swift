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
    
    // tai sao can @... nay
    @discardableResult func createItem() ->Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
        
    }
    
    func filterItemsBy(_ price: Int = 50) -> [[Item]] {
        var filterItems = [[Item](), [Item]()]
        
        for item in allItems {
            if item.valueInDollars > price {
                filterItems[0].append(item)
            } else {
                filterItems[1].append(item)
            }
        }
        
        return filterItems
    }
    
    init() {
        for _ in 0..<15 {
            
            createItem()
            
        }
    }
}
