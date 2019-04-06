//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by Matvey on 4/6/19.
//  Copyright © 2019 Matvey. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var isCompleteButton: UIButton!
    
    @IBOutlet weak var dueDateLabel: UILabel!
    
    @IBOutlet weak var dueDatePickerView: UIDatePicker!
    
    @IBOutlet weak var notesTextView: UITextView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        
        updateSaveButtonState()
        
    }
    
    // dismiss keyboard
    @IBAction func returnPressed(_ sender: UITextField) {
        
        titleTextField.resignFirstResponder()
        
    }
    
    // check or uncheck
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        
        isCompleteButton.isSelected = !isCompleteButton.isSelected
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButtonState()
    }
    
    func updateSaveButtonState() {
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
}
