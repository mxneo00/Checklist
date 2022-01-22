//
//  ViewController.swift
//  Checklists
//
//  Created by Katellyn Hyker on 1/21/22.
//

import UIKit

class ChecklistViewController: UITableViewController {
    var items = [ChecklistItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = ChecklistItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        let item2 = ChecklistItem()
        item1.text = "Brush my teeth"
        item2.checked = true
        items.append(item2)
        
        let item3 = ChecklistItem()
        item1.text = "Learn iOS development"
        item3.checked = true
        items.append(item3)
        
        let item4 = ChecklistItem()
        item1.text = "Soccer practice"
        items.append(item4)
        
        let item5 = ChecklistItem()
        item1.text = "Eat ice cream"
        item5.checked = true
        items.append(item5)
    }
    //MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row == 0 {
            label.text = row0item.text
        } else if indexPath.row == 1 {
            label.text = row1item.text
        } else if indexPath.row == 2 {
            label.text = row2item.text
        } else if indexPath.row == 3 {
            label.text = row3item.text
        } else if indexPath.row == 4 {
            label.text = row4item.text
        }
        configureCheckmark(for: cell, at: indexPath)
        return cell
    }
    func configureCheckmark( for cell: UITableViewCell, at indexPath: IndexPath) {
        var isChecked = false
        if indexPath.row == 0 {
            isChecked = row0item.checked
        } else if indexPath.row == 1 {
            isChecked = row1item.checked
        } else if indexPath.row == 2 {
            isChecked = row2item.checked
        } else if indexPath.row == 3 {
            isChecked = row3item.checked
        } else if indexPath.row == 4 {
            isChecked = row4item.checked
        }
        
        if isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    //MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if indexPath.row == 0{
                row0item.checked.toggle()
            } else if indexPath.row == 1 {
                row1item.checked.toggle()
            } else if indexPath.row == 2 {
                row2item.checked.toggle()
            } else if indexPath.row == 3 {
                row3item.checked.toggle()
            } else if indexPath.row == 4 {
                row4item.checked.toggle()
            }
            configureCheckmark(for: cell, at: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

