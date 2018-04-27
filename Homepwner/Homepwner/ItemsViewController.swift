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
    
    var itemStore: ItemStore!
    
    var imageStore: ImageStore!
    @IBAction func addNewItem(_ sender: AnyObject?) {
        
        let newItem = itemStore.createItem()
        
        if let index = itemStore.allItems.index(of: newItem){
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            
            let title = "Delete \(item.name)"
            
            let mesage = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: title, message: mesage, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
                self.itemStore.removeItem(item)
                
                // remove the item's image from the image store
                self.imageStore.deleteImage(forKey: item.itemKey!)
                
                self.tableView.deleteRows(at: [indexPath], with: .automatic)

            })
            
            ac.addAction(deleteAction)
            
            present(ac, animated: true, completion: nil)
        }
    }
    //  bronze challenge
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Remove"
    }
    //  siler challenge
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if (indexPath.row >= itemStore.allItems.count) {
            return false
        } else {
            return true
        }
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if (destinationIndexPath.row < itemStore.allItems.count) {
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        } else {
            itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row - 1)
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return itemStore.allItems.count + 1
    }
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        if (proposedDestinationIndexPath.row >= itemStore.allItems.count) {
            return sourceIndexPath
        }
        return proposedDestinationIndexPath
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        if indexPath.row < itemStore.allItems.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
            
            let item = itemStore.allItems[indexPath.row]
            
            cell.nameLabel.text = item.name
            
            cell.serialNumberLabel.text = item.serialNumber
            
            cell.valueLabel.text = "$\(item.valueInDollars)"
            
            if item.valueInDollars < 50 {
                cell.valueLabel.textColor = UIColor.red
                //print("here")
            } else {
                cell.valueLabel.textColor = UIColor.green
            }
            
            return cell
        } else {
            let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
            cell.textLabel?.text = "No more Items!"
            return cell
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.estimatedRowHeight = 65
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showItem"?:
            if let row = tableView.indexPathForSelectedRow?.row{
                let item = itemStore.allItems[row]
                let detailView = segue.destination as! DetailViewController
                detailView.item = item
                detailView.imageStore = imageStore
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}
