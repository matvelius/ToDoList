//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by Matvey on 4/6/19.
//  Copyright © 2019 Matvey. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    
    var todo: ToDo?
    
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
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        
        updateDueDateLabel(date: dueDatePickerView.date)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let todo = todo {
            
            navigationItem.title = "To-Do"
            titleTextField.text = todo.title
            isCompleteButton.isSelected = todo.isComplete
            dueDatePickerView.date = todo.dueDate
            notesTextView.text = todo.notes
            
        } else {
            
            dueDatePickerView.date = Date().addingTimeInterval(24*60*60)
            
        }
        
        updateDueDateLabel(date: dueDatePickerView.date)
        updateSaveButtonState()
        
    }
    
    var isPickerHidden = true
    
    func updateDueDateLabel(date: Date) {
        dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
    
    func updateSaveButtonState() {
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let normalCellHeight = CGFloat(44)
        let largeCellHeight = CGFloat(200)
        
        print(isPickerHidden)
        
        switch (indexPath) {
            
        case [1,0]: // due date cell
            return isPickerHidden ? normalCellHeight : largeCellHeight
            
        case [2, 0]: // notes cell
            return largeCellHeight
            
        default:
            return normalCellHeight
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(isPickerHidden)
        
        switch (indexPath) {
            
        case [1,0]:
            isPickerHidden = !isPickerHidden
            
            dueDateLabel.textColor = isPickerHidden ? .black : tableView.tintColor
            
            // animation
            tableView.beginUpdates()
            tableView.endUpdates()
            
        default:
            break
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let title = titleTextField.text!
        let isComplete = isCompleteButton.isSelected
        let dueDate = dueDatePickerView.date
        let notes = notesTextView.text
        
        todo = ToDo(title: title, isComplete: isComplete, dueDate: dueDate, notes: notes)
        
    }
    
}
