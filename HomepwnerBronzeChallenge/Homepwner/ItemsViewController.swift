//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Van Anh on 3/9/18.
//  Copyright © 2018 Van Anh. All rights reserved.
//

//import Foundation

import UIKit


class ItemsViewController: UITableViewController {
    
    var filteredItems = [[Item]()]
    
    var itemStore: ItemStore! {
        
        didSet {
            //reload table
            filteredItems = itemStore.filterItemsBy()
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return filteredItems.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Over $50"
        case 1:
            return "Under $50"
        default:
            return nil
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 && indexPath.row == filteredItems[indexPath.section].count {
            return 44
        }else{
            return 60
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return filteredItems[section].count
        switch section {
        case 0:
            return filteredItems[section].count
        default:
            return filteredItems[section].count + 1 // "one line for No more items"
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let indexOfSesion = indexPath.section
        
        let indexOfRow = indexPath.row
        
        let sesions = filteredItems[indexOfSesion]
        
        if indexOfRow <= filteredItems[indexOfSesion].count - 1 {
            // gold challage
            
            //tableView.rowHeight = 60
            
            let item = sesions[indexOfRow]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
            
            cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
            
            cell.textLabel?.text = item.name
            
            cell.detailTextLabel?.text = "$\(item.valueInDollars)"
            
            cell.backgroundColor = UIColor.clear
            
            return cell
        } else {
            
            //tableView.rowHeight = 44
            
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "noMoreItem", for: indexPath) as! MyCellTableViewCell
            
            cell1.content?.text = "No more item"
            
            cell1.backgroundColor = UIColor.clear
            
            return cell1
            
        }
        

    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        
        tableView.scrollIndicatorInsets = insets
        
        let imageTableView = UIImageView(image: UIImage(named: "background.jpg"))
        
        imageTableView.contentMode = .scaleAspectFill
        
        tableView.backgroundView = imageTableView
        
        
    }
    
}
