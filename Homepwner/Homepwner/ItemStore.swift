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
    
    let itemArchivieURL : URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    // tai sao can @... nay
    @discardableResult func createItem() ->Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
        
    }
    func removeItem(_ item : Item) {
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
    }
    func moveItem(from fromIndex: Int, to toIndex: Int){
        if fromIndex == toIndex {
            return
        }
        let movedItem = allItems[fromIndex]
        
        allItems.remove(at: fromIndex)
        
        allItems.insert(movedItem, at: toIndex)
    }
    
    func saveChanges() ->Bool {
        print("Save items to: \(itemArchivieURL.path)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchivieURL.path)
    }
    
    init() {
        if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: itemArchivieURL.path) as? [Item] {
            allItems = archivedItems
        }
        
    }
}
