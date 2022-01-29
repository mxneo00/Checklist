//
//  Checklist.swift
//  Checklists
//
//  Created by Katellyn Hyker on 1/28/22.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
