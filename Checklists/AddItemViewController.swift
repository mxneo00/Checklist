//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Katellyn Hyker on 1/22/22.
//

import UIKit

protocol AddItemViewControllerDelegate: AnyObject {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem)
    
}
class AddItemViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    weak var delegate: AddItemViewControllerDelegate?
    var itemToEdit: ChecklistItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        if let item = itemToEdit {
            title  = "Edit Item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }
    }
    //MARK: - Actions
    @IBAction func cancel() {
        delegate?.addItemViewControllerDidCancel(self)
    }
    @IBAction func done() {
        let item = ChecklistItem()
        item.text = textField.text!
        
        delegate?.addItemViewController(self, didFinishAdding: item)
    }
    //MARK: - Table View Delegates
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPAth: IndexPath) -> IndexPath? {
        return nil
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    //MARK: - Text Field Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            doneBarButton.isEnabled = false
        } else {
            doneBarButton.isEnabled = true
        }
        return true
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }
}
