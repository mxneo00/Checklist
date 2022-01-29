//
//  ListDetailViewController.swift
//  Checklists
//
//  Created by Katellyn Hyker on 1/28/22.
//

import Foundation
import UIKit

protocol ListDetailViewControllerDelegate: AnyObject {
    func listDetailViewControllerDidCancel(_  controller: ListDetailViewController)
    
    func listDetailViewController(_ controller: ListDetailViewController,  didFinishAdding  checklist:  Checklist)
    
    func  listDetailViewController(_ controller: ListDetailViewController, didFinishEditing checklist: Checklist)
}

class ListDetailViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet var  textField: UITextField!
    @IBOutlet  var doneBarButton: UIBarButtonItem!
    
    weak var delegate: ListDetailViewControllerDelegate?
    
    var checklistToEdit: Checklist?
    
    override  func viewDidLoad() {
        super.viewDidLoad()
        
        if let  checklist = checklistToEdit {
            title = "Edit Checklist"
            textField.text = checklist.name
            doneBarButton.isEnabled = true
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
}
