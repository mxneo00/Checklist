//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Katellyn Hyker on 1/21/22.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    var text = ""
    var checked = false
    var dueDate = Date()
    var shouldRemind = false
    var itemID = -1
    
    override init() {
        super.init()
        itemID = DataModel.nextChecklistItemID()
    }
}
